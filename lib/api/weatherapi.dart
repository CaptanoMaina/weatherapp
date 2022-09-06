import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myt_weatherapp/models/weather.dart';

class WeatherApi {
  Future<List<Weather>> getWeather() async {
    var uriCall = Uri.parse(
        'https://raw.githubusercontent.com/stephangopaul/weather_sample/main/forecast.json');

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);

    List<Weather> weatherList = (json.decode(response.body)['Data'] as List)
        .map((data) => Weather.fromJson(data))
        .toList();

    return weatherList;
  }
}
