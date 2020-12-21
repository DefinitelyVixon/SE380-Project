import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'user.dart';
import 'package:SE380_Project/database.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App In Progress',
      home: LiveMap(),
    );
  }
}

class LiveMap extends StatefulWidget {
  @override
  State<LiveMap> createState() => LiveMapState();
}

class LiveMapState extends State<LiveMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.423672, 27.142806),
    zoom: 15,
  );

  static final CameraPosition _kGoLocation = CameraPosition(
      target: LatLng(38.388103, 27.044829),
      zoom: 15);
  // bearing: 192.8334901395799,

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goTo,
        label: Text('Go To'),
        icon: Icon(Icons.work),
      ),
    );
  }

  Future<void> _goTo() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGoLocation));

    newUser();
  }

  void newUser(){
    var user = new User("20190602002", "Kappa123");
    user.setId(addUser(user));
  }
}
