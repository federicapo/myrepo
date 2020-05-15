import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class GoogleProva extends StatefulWidget {
  @override
  _GoogleProvaState createState() => _GoogleProvaState();
}

class _GoogleProvaState extends State<GoogleProva> {
  final _key = GlobalKey<GoogleMapStateBase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        key: _key,
        initialZoom: 12,
        initialPosition: GeoCoord(34, -118),
        mapType: MapType.roadmap,
        interactive: true,
        markers: {Marker(GeoCoord(34, -118))},
      ),
    );
  }
}
