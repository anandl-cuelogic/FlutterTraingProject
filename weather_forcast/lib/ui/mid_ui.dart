import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/convert_icon.dart';
import 'package:weather_forcast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formatedate =
    new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$city, $country",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87),
            ),
            Text(
              "${Util.getFormatedDate(formatedate)}",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDecription: forecastList[0].weather[0].main,color: Colors.pinkAccent,
                  iconSize: 170),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${forecastList[0].main.humidity}°F",
                    style: TextStyle(fontSize: 34),
                  ),
                  Text("${forecastList[0].weather[0].description.toUpperCase()}"),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "${forecastList[0].wind.speed.toStringAsFixed(1)} mi/h"),
                        Icon(
                            FontAwesomeIcons.wind, size: 20,color: Colors.brown
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "${forecastList[0].main.humidity.toStringAsFixed(1)}%"),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20,
                          color: Colors.brown,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            "${forecastList[0].main.tempMax.toStringAsFixed(0)}°F"),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20,
                          color: Colors.brown,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




