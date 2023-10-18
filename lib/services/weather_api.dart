import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3837f082b65893f0fc5883912ebd9ac8&units=metric");

    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);
    } else {
      // If the request was not successful, you can handle the error here
      //  print("Request failed with status: ${response.statusCode}");
      throw Exception("Request failed with status: ${response.statusCode}");
    }
  }
}
