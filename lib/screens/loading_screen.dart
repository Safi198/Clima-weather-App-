import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherMode1 weatherMode1=WeatherMode1();
    var weatherData=await weatherMode1.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationweather: weatherData,
          );
        },
      ),
    );

    // var long = jsonDecode(data)['coord']['lon'];
    // print('Lonigtude is = $long');
    // //if confusion look to https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22#
    // var description = decodedData['weather'][0]['description'];
    // print('Description is = $description');
    //
    // var weatherData = await networkHelper.getData();
    //
    // print('Condition is = $condition');
    // print('Temperature is = $temp');
    // print('City is =  $city');
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
