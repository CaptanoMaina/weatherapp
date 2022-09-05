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
}
