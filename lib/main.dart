import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
const MyApp({super.key});

@override
State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
late GoogleMapController mapController;

final LatLng _center = const LatLng(25.363434,68.35051);

void _onMapCreated(GoogleMapController controller) {
mapController = controller;
}

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
appBar: AppBar(
title: const Text('Google Maps'),
backgroundColor: Colors.teal,
),
body: GoogleMap(
onMapCreated: _onMapCreated,
initialCameraPosition: CameraPosition(
target: _center,
zoom: 16.0,
),
),
),
);
}
}