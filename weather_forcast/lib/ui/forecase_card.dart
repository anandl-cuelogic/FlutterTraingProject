
import 'package:flutter/material.dart';
import 'package:weather_forcast/model/weather_forecast_model.dart';
import 'package:weather_forcast/util/convert_icon.dart';
import 'package:weather_forcast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormatedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDecription: forecastList[index].weather[0].main,
            color: Colors.pinkAccent, iconSize: 44),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList[index].main.tempMin.toStringAsFixed(0)}°F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList[index].main.tempMax.toStringAsFixed(0)}°F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Hum:${forecastList[index].main.humidity.toStringAsFixed(0)}% "),
                  ),
                 // Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17,)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("wind:${forecastList[index].wind.speed.toStringAsFixed(1)} mi/h"),
                  ),
                 // Icon(FontAwesomeIcons.wind,color: Colors.white,size: 17,)
                ],
              )
            ],
          )
        ],
      ),
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${forecastList[index].dtTxt}"),
      ))
    ],

  );

}