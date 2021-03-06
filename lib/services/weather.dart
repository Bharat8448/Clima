import 'package:clima/services/location.dart ';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/loading_screen.dart';
const apikey='1c71168bcb1515cc15e5cb4bfe702777';

class WeatherModel {
  double long;
  double lati;
  Future<dynamic>getcityweather (String cityName) async{

    Network network=Network('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherdata=await network.getdata();
return weatherdata;
  }

  Future<dynamic> locationweather() async{

    Location location=Location();
    await location.getcurrentlocation();
    long=location.longitude;
    lati=location.latitude;
    Network network=Network('https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$long&appid=$apikey&units=metric');

    var weatherdata= await network.getdata();
    return weatherdata;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
