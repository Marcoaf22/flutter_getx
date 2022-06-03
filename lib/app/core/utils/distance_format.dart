import 'package:flutter/material.dart';

String distanceFormat(int valueInMeters) {
  if (valueInMeters >= 1000) {
    return "${(valueInMeters / 1000).toStringAsFixed(1)} km";
  }
  return "$valueInMeters m";
}

List<String> lista = [
  'Ene',
  'Feb',
  'Mar',
  'Abr',
  'May',
  'Jun',
  'Jul',
  'Ago',
  'Sep',
  'Oct',
  'Nov',
  'Dic'
];

String dateFormat(DateTime time) {
  return '${lista.elementAt(time.month)} ${time.day}・${time.hour}:${time.minute}';
}

Color colorDeCarga(int a) {
  switch (a) {
    case 1:
      return Colors.blue;

    case 2:
      return Colors.orange;

    case 3:
      return Colors.deepPurple;

    case 4:
      return Colors.brown;
    default:
      return Colors.black;
  }
}
