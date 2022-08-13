import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = (response.body);
      print(data);

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
      /*
    if status code is between 100 and 200 it means Informational
    if status code is between 200 and 300 it means Success everything is good
    if status code is between 300 and 400 it means Redirection Multiples choices
    if status code is between 400 and 500 it means Client error in url or any other thing
    if status code is higher then 500  it means Server error
    */
    }
  }
}
