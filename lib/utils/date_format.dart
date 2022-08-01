  import 'package:flutter/material.dart';
 
 
// Formatting the date !

String getDateFormat(DateTime date) {
    String day;
    String month;

    day = date.day.toString();
    if (date.day < 10) {
      day = '0${date.day}';
    }

    month = date.month.toString();
    if (date.month < 10) {
      month = '0${date.month}';
    }

    return '$day-$month-${date.year}';
  }

  String getTimeFormat(TimeOfDay time) {
    String hour;
    String minute;

    hour = time.hour.toString();
    if (time.hour < 10) {
      hour = '0$hour';
    }

    minute = time.minute.toString();
    if (time.minute < 10) {
      minute = '0$minute';
    }
    return '$hour:$minute';
  }