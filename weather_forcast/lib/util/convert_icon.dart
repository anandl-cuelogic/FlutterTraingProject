import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget getWeatherIcon({String weatherDecription, Color color, double iconSize}) {

  switch(weatherDecription){
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, color: color,size: iconSize,);
      }
      break;
    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud, color: color,size: iconSize,);
      }
      break;
    case "Rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, color: color,size: iconSize,);
      }
      break;
    case "Snow":
      {
        return Icon(FontAwesomeIcons.snowman, color: color,size: iconSize,);

      }
      break;
    default: {
      return Icon(FontAwesomeIcons.sun, color: color,size: iconSize,);
    }
    break;
  }

}