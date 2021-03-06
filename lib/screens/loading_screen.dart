import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
WeatherModel weatherModel=WeatherModel();
   void getLocationdata() async{
var weatherdata=await weatherModel.locationweather();
   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen(weatherdata);
   }));



  }





  @override
  void initState() {
    super.initState();
    getLocationdata();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
