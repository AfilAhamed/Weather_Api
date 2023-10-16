import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../services/weather_api.dart';

class WeatherController extends ChangeNotifier {
  WeatherApi client = WeatherApi();
  Weather? data;
  final nameController = TextEditingController();
  String countryName = 'london';

  searchCountry() {
    getdata();
    countryName = nameController.text;
    countryName;

    notifyListeners();
  }

  Future<void> getdata() async {
    data = await client.getCurrentWeather(countryName);
  }
}
