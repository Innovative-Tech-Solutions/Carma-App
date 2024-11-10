import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final LatLng _locationA = const LatLng(45.521563, -122.677433);
  final LatLng _locationB = const LatLng(45.515, -122.679);

  Set<Marker> _markers = {};
  BitmapDescriptor? _movingObjectIcon;

  @override
  void initState() {
    super.initState();
    _setCustomMarkerIcon();
    _addMarkers();
    _startMoving();
  }

  void _setCustomMarkerIcon() async {
    _movingObjectIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/bookImage.png',
    );
  }

  void _addMarkers() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('locationA'),
        position: _locationA,
        infoWindow: InfoWindow(title: 'Location A'),
      ));
      _markers.add(Marker(
        markerId: MarkerId('locationB'),
        position: _locationB,
        infoWindow: InfoWindow(title: 'Location B'),
      ));
    });
  }

  void _startMoving() {
    const totalDuration = Duration(seconds: 10);
    const fps = 30.0;
    final totalSteps = totalDuration.inMilliseconds / (1000 / fps);

    final latDiff = _locationB.latitude - _locationA.latitude;
    final lngDiff = _locationB.longitude - _locationA.longitude;

    Timer.periodic(Duration(milliseconds: (1000 / fps).round()), (timer) {
      if (timer.tick >= totalSteps) {
        timer.cancel();
        return;
      }

      final progress = timer.tick / totalSteps;
      final currentLat = _locationA.latitude + (latDiff * progress);
      final currentLng = _locationA.longitude + (lngDiff * progress);

      setState(() {
        _markers.removeWhere((m) => m.markerId.value == 'movingObject');
        _markers.add(Marker(
          markerId: MarkerId('movingObject'),
          position: LatLng(currentLat, currentLng),
          icon: _movingObjectIcon ?? BitmapDescriptor.defaultMarker,
        ));
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mock Geolocation'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
        markers: _markers,
      ),
    );
  }
}
