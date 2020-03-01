import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/network/network.dart';
import 'package:weather_forcast/ui/bottum_ui.dart';

import 'ui/mid_ui.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String cityName = "Mumbai";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeatherForeCast(cityName);

      forecastObject.then((value){
      print(value.list[0].weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if(snapshot.hasData){
                    return Column(
                      children: <Widget>[
                        MidView(snapshot: snapshot),
                       // midView(snapshot),
                       BottomView(snapshot: snapshot)
                       // bottomView(snapshot, context),
                      ],
                    );
                  }else {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter city name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(8)),
          onSubmitted: (value) {
            setState(() {
              cityName = value;
              forecastObject = getWeatherForeCast(cityName);
            });

          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeatherForeCast(String value) => new Network().getWeatherForcast(cityName: value);
}
