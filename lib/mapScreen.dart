import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'getLocation.dart';
import 'package:http/http.dart' as http;
import 'nearbyPlaces.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  static double? lat, long;




  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async{
    var service = GetLocationData();
    var locationData = await service.getLocation();


    if (locationData != null){
      setState(() {
        lat = locationData.latitude;
        long =locationData.longitude;
      });
    }


  }

  late GoogleMapController _googleMapController;
  Marker _user = Marker(
    markerId: const MarkerId('origin'),
    infoWindow: const InfoWindow(title: 'You\'re Location'),
    icon:
    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(lat ?? 12, long ?? 137),
  );
  final Set<Marker> _markers = {};



  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: ModalRoute.of(context)?.canPop == true
              ? IconButton(
            icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black
            ),
            onPressed: () => Navigator.of(context).pop(),
          ) : null,
          title: Text(
              'Safe Spaces',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black
              )
          ),
          backgroundColor: Color(0XFFC1C4FF)
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat ?? 0, long ?? 0),
          zoom: 19,
        ),
        onMapCreated: (controller) => _googleMapController = controller,
        markers: _markers,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,

        onPressed: () {
          getLocation();
          getNearbyPlaces();
          _user = Marker(
            markerId: const MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'You\'re Location'),
            icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            position: LatLng(lat ?? 37, long ?? 122),
          );
          _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(CameraPosition(
                target:
                LatLng(lat ?? 0, long ?? 0),
                zoom: 12,)
              )
          );
          _markers.add(_user);
          _markers.add(_addMarker(const LatLng(37, -122), "Middle Of Earth"));
          for (int i = 0; i<locationList.length; i++){
            _markers.add(_addMarker(locationList[i][1], locationList[i][0]));
          }

        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  Marker _addMarker(LatLng pos, String title){
    return Marker(
      markerId: MarkerId(title.toLowerCase()),
      infoWindow: InfoWindow(title: title),
      icon:
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: pos,
    );
  }





  var locationList = [];

  void getNearbyPlaces() async {

    String apiKey = "AIzaSyDFo2lnCxaVuvee3QOS3dIv48zsvW67KHo";
    String radius = "5000";
    double latitude = lat ?? 0;
    double longitude = long ?? 0;
    NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();


    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&key=$apiKey');

    var response = await http.post(url);


    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));


    // setState(() {});

    for(int i = 0 ; i < nearbyPlacesResponse.results!.length; i++){
      locationList.add(nearbyLocation(nearbyPlacesResponse.results![i]));
    }

    print(locationList);
  }

  List nearbyLocation (Results results){
    return [results.name!, LatLng(results.geometry!.location!.lat ?? 0, results.geometry!.location!.lng ?? 0)];
  }
}