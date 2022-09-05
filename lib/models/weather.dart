import 'package:geolocator/geolocator.dart';
import 'dart:math';

class Weather {
  var locality;
  var iconUrl;
  var lastUpdateTime;
  var humidity;
  var name;
  var minTemperature;
  var maxTemperature;
  var longitude;
  var latitude;

  Weather(
      {required this.locality,
      required this.iconUrl,
      required this.lastUpdateTime,
      required this.humidity,
      required this.name,
      required this.minTemperature,
      required this.maxTemperature,
      required this.longitude,
      required this.latitude});

  Weather.fromJson(Map<String, dynamic> json) {
    locality = json["Locality"];
    iconUrl = json['IconUrl'];
    lastUpdateTime = json['Date'];
    humidity = json['Humidity'];
    name = json['Name'];
    minTemperature = json['MinTemperature'];
    maxTemperature = json['MaxTemperature'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
  }

  static Weather GetNearestWeatherData(
      Position position, List<Weather> weatherList) {
    double longitude = position.longitude;
    double latitude = position.latitude;

    var possibleWeather = 0;
    double possibleDistance = 0;

    for (var w = 0; w < weatherList.length; w++) {
      double distance = haversine(latitude, longitude, weatherList[w].latitude,
          weatherList[w].longitude);

      if (distance == 0) {
        possibleWeather = w;
        possibleDistance = distance;

        break;
      } else if (w == 0) {
        possibleWeather = w;
        possibleDistance = distance;
      } else if (distance < possibleDistance) {
        possibleWeather = w;
        possibleDistance = distance;
      }
    }

    print(latitude);
    print(longitude);

    return weatherList[possibleWeather];
  }

  static final R = 6372.8; // In kilometers

  static double haversine(double lat1, lon1, lat2, lon2) {
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);
    lat1 = _toRadians(lat1);
    lat2 = _toRadians(lat2);
    double a =
        pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
    double c = 2 * asin(sqrt(a));
    return R * c;
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
