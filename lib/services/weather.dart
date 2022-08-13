import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
const apiKey =
    'cc952c60f119d6ab68e4696c7e8d0868'; // by creating account in open weather
const openWeatherMap='https://api.openweathermap.org/data/2.5/weather';
class WeatherMode1{

  Future<dynamic> getCityWeather(String cityName) async
  {
    var url='$openWeatherMap?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url: url);
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();
    String url =
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weather = await networkHelper.getData();

    return weather;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}