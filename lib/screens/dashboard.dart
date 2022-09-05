import 'package:flutter/material.dart';
import 'package:myt_weatherapp/api/weatherapi.dart';
import 'package:myt_weatherapp/components/constants.dart';
import 'package:myt_weatherapp/components/locator.dart';
import 'package:myt_weatherapp/models/weather.dart';

class Dashboard extends StatelessWidget {
  var client = WeatherApi();
  var weather;

  info() async {
    var position = await GetPosition();
    var weatherList = await client.getWeather();
    weather = Weather.GetNearestWeatherData(position, weatherList);
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 1.0,
                  width: size.width,
                  padding: EdgeInsets.only(top: 50),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: LinearGradient(
                        colors: [kAccentColor, kPrimaryColor],
                        begin: Alignment.bottomRight,
                        end: Alignment.topCenter,
                        stops: [0.01, 0.55]),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${weather?.locality}',
                        style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 39,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        'Monday, 05 September',
                        style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w100),
                      ),
                      Image.network(
                        // 'https:${weather?.iconUrl}',
                        'https://openweathermap.org/img/wn/10d@2x.png',
                        width: size.width * 0.4,
                      ),
                      Text(
                        '${weather?.maxTemperature}°',
                        style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 39,
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        '${weather?.name}',
                        style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            Text(
                              'Humidity: ${weather?.humidity}',
                              style: TextStyle(
                                  color: kPrimaryLightColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Minimum Temperature: ${weather?.minTemperature}°',
                              style: TextStyle(
                                  color: kPrimaryLightColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Maximum Temperature: ${weather?.maxTemperature}°',
                              style: TextStyle(
                                  color: kPrimaryLightColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Last Updated Time: ${weather?.lastUpdateTime}',
                              style: TextStyle(
                                  color: kPrimaryLightColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      /*
                      Container(
                        padding: EdgeInsets.only(top: 180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Alerts ',
                                style: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Emergenct Info ',
                                style: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Support ',
                                style: TextStyle(
                                    color: kPrimaryLightColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                          ],
                        ),
                      ),
                    */
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
