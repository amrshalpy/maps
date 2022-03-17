import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/google_location/google_location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> completer = Completer();
  static Position? position;
  var address = 'your address';
  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 17,
    tilt: 0,
    bearing: 0,
  );

  Future<void> getAddress() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark place = placemarks[0];
    address =
        ('${place.country}, ${place.street}, ${place.subLocality}').toString();
    print(address);
  }

  Future<void> getMyCurrentLocatio() async {
    await LocationMap.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        completer.complete(controller);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyCurrentLocatio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          position != null
              ? buildMap()
              : const Center(child: CircularProgressIndicator()),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10), right: Radius.circular(10)),
                color: Colors.white.withOpacity(.8)),
            child: Container(
              margin: const EdgeInsetsDirectional.fromSTEB(12, 25, 12, 12),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: InkWell(
                        onTap: () {
                          getAddress();
                        },
                        child: Center(
                          child: const Text(
                            'from ....',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: InkWell(
                      onTap: () {
                        getAddress();
                      },
                      child: Center(
                        child: Text(
                          '$address',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
