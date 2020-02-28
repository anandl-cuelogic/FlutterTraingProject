import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network();
    forecastObject = network.getWeatherForcast(cityName:"Mumbai");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Title")),
      ),
    );
  }
}
