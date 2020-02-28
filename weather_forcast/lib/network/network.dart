
import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/forecast_util.dart';
import 'package:weather_forcast/weather_forecast.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForcast({String cityName}) async {
    var finalUrl ="https://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid="+Util.appId;

    final Response response = await get(Uri.encodeFull(finalUrl));
    print("URL:${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200) {
      print("weather data: ${response.body}");
     return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error");
    }
  }
}
