import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gojek/features/goride/page/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as img;

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  late double _originLatitude, _originLongitude;
  Map<MarkerId, Marker> markers = {};
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool isLoading = false;

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
    BitmapDescriptor customIcon = await _getResizedMarkerIcon(
        'assets/icon/goride/driver_pin_location.png', 25);

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

    final random = Random();
    for (int i = 0; i < 7; i++) {
      final offsetLat = (random.nextDouble() - 0.5) /
          250;
      final offsetLng = (random.nextDouble() - 0.5) /
          250; 
      final markerLat = position.latitude + offsetLat;
      final markerLng = position.longitude + offsetLng;

      _addMarker(LatLng(markerLat, markerLng), "marker_$i", customIcon);
    }

    setState(() {
      isLoading = false;
    });
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


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: SizedBox(
          height: 115,
          child: (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(_originLatitude, _originLongitude),
                      zoom: 16),
                  myLocationEnabled: true,
                  tiltGesturesEnabled: false,
                  compassEnabled: true,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: true,
                  onMapCreated: _onMapCreated,
                  markers: Set<Marker>.of(markers.values),
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  trafficEnabled: true,
                  onTap: (_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapPage()));
                  },
                ),
        ),
      ),
    );
  }
}
