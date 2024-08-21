import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gojek/helpers/debouncer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    _getUserLocation(context);
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

  Future<void> _getUserLocation(BuildContext context) async {
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
    if (context.mounted) {
      _getAddressFromLatLng(context, _originLatitude, _originLongitude);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _getAddressFromLatLng(
      BuildContext context, double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Gagal mendapatkan data lokasi"),
        ));
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  Future<void> _onCameraMove(CameraPosition position) async {
    const centerMarkerId = MarkerId("destination");

    if (markers.containsKey(centerMarkerId)) {
      setState(() {
        markers[centerMarkerId] = markers[centerMarkerId]!.copyWith(
          positionParam: position.target,
        );
      });
    }
    _debouncer.run(() {
      _getAddressFromLatLng(
          context, position.target.latitude, position.target.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(_originLatitude, _originLongitude),
                      zoom: 16),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  tiltGesturesEnabled: false,
                  compassEnabled: false,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  onMapCreated: _onMapCreated,
                  markers: Set<Marker>.of(markers.values),
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  trafficEnabled: false,
                  onCameraMove: _onCameraMove,
                ),
                SizedBox(
                  // padding: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Image.asset(
                        'assets/icon/goride/pin_map.png',
                        fit: BoxFit.fitWidth,
                        width: 40,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF000000)
                                              .withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.arrow_back)),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 1),
                                      )
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.gps_fixed)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF000000).withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 1),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Set lokasi tujuan",
                                    style: TextStyle(
                                        fontFamily: "MaisonNeueBold",
                                        fontSize: 18),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF066A0B),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(360),
                                      ),
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontFamily: "MaisonNeueBold",
                                            fontSize: 14,
                                            color: Color(0xFF066A0B)),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFA9FFA6),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 28,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF06400),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xFFA9FFA6),
                                                    shape: BoxShape.circle,
                                                  )),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _currentAddress
                                                          ?.split(', Kecamatan')
                                                          .first ??
                                                      "Loading address...",
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          "MaisonNeueBold",
                                                      fontSize: 16),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  _currentAddress ??
                                                      "Loading address...",
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          "MaisonNeueLight",
                                                      fontSize: 12,
                                                      color: Color(0xFF000000)),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const Icon(
                                      Icons.bookmark_rounded,
                                      color: Color(0xFF949494),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF07650A),
                                  borderRadius: BorderRadius.circular(360),
                                ),
                                child: const Text(
                                  "Lanjut",
                                  style: TextStyle(
                                      fontFamily: "MaisonNeueBold",
                                      fontSize: 16,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
