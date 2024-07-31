import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gojek/helpers/debouncer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late double _originLatitude, _originLongitude;
  Map<MarkerId, Marker> markers = {};
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool isLoading = false;
  String? _currentAddress;
  final Debouncer _debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<bool> _handlePermission() async {
    LocationPermission permission;
    await _geolocatorPlatform.isLocationServiceEnabled();
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  Future<void> _getUserLocation() async {
    setState(() {
      isLoading = true;
    });

    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _originLatitude = position.latitude;
      _originLongitude = position.longitude;
    });

    _addMarker(LatLng(_originLatitude, _originLongitude), "center",
        BitmapDescriptor.defaultMarker);
    _getAddressFromLatLng(_originLatitude, _originLongitude);

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<BitmapDescriptor> _getResizedMarkerIcon(
      String assetPath, int size) async {
    ByteData data = await rootBundle.load(assetPath);
    Uint8List bytes = data.buffer.asUint8List();
    img.Image image = img.decodeImage(bytes)!;

    img.Image resizedImage = img.copyResize(image, width: size, height: size);

    Uint8List resizedBytes = Uint8List.fromList(img.encodePng(resizedImage));
    BitmapDescriptor bitmapDescriptor = BitmapDescriptor.bytes(resizedBytes);
    return bitmapDescriptor;
  }

  void _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    Marker marker = Marker(
      markerId: MarkerId(id),
      position: position,
      icon: descriptor,
      infoWindow: InfoWindow(title: id),
    );

    setState(() {
      markers[MarkerId(id)] = marker;
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Future<void> _onCameraMove(CameraPosition position) async {
    final centerMarkerId = MarkerId("center");

    if (markers.containsKey(centerMarkerId)) {
      setState(() {
        markers[centerMarkerId] = markers[centerMarkerId]!.copyWith(
          positionParam: position.target,
        );
      });
    } else {
      BitmapDescriptor customIcon = await _getResizedMarkerIcon(
          'assets/icon/goride/pin_map.png', 25);
      _addMarker(position.target, "center", customIcon);
    }
    _debouncer.run(() {
      _getAddressFromLatLng(
          position.target.latitude, position.target.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentAddress ?? "Loading address..."),
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_originLatitude, _originLongitude), zoom: 16),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              trafficEnabled: true,
              onCameraMove: _onCameraMove,
              onTap: (value) {
                setState(() {
                  _addMarker(value, "destination",
                      BitmapDescriptor.defaultMarkerWithHue(90));
                });
                _debouncer.run(() {
                  _getAddressFromLatLng(value.latitude, value.longitude);
                });
              },
            ),
    );
  }
}
