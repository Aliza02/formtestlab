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
static const LatLng _center = LatLng(25.407291895209095,68.26326549053192);
final Set<Marker> _marker = {};
LatLng _currentPosition = _center;

void _onAddMarkerButtonPressed(){
setState(() {
_marker.add(Marker(
markerId: MarkerId(_currentPosition.toString()),
position: _currentPosition,
infoWindow: InfoWindow(
title: "19SW20",
snippet: _currentPosition.toString()
),
icon: BitmapDescriptor.defaultMarker,
));
});
}

void _onCameraMove(CameraPosition position){
_currentPosition = position.target;
}


void _onMapCreated(GoogleMapController controller) {
mapController = controller;
}

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
appBar: AppBar(
title: const Text('Google Maps with Marker'),
backgroundColor: Colors.green,
),
body: Stack(
children: [
GoogleMap(
initialCameraPosition: CameraPosition(
target: _center,
zoom: 15,
),
markers: _marker,
onCameraMove: _onCameraMove,
),
Padding(padding: const EdgeInsets.all(16),
child: Align(
alignment: Alignment.topRight,
child: FloatingActionButton(
onPressed: _onAddMarkerButtonPressed,
materialTapTargetSize: MaterialTapTargetSize.padded,
backgroundColor: Colors.green,
child: const Icon(Icons.map,size:30),
),
),)
],
)
),
);
}
}