import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//Convert date to UTC
String formatDate(String dateTime) {
  // Parse the date string into a DateTime object
  var dateUtc = DateTime.now();
  DateTime utcTime = dateUtc.toUtc();
  // Define a format for the desired output
  var correctTime = utcTime.toIso8601String();
  return correctTime;
}
String formatDatetoUTC(DateTime dateTime) {
  // Parse the date string into a DateTime object
  var dateUtc = dateTime;
  DateTime utcTime = dateUtc.toUtc();
  // Define a format for the desired output
  var correctTime = utcTime.toIso8601String();
  return correctTime;
}

//Convert dateFormat to UTC
String formatDateFromUtc(DateTime dateTime) {
  final formatter = DateFormat('yyyy/MM/dd');
  final formattedDate = formatter.format(dateTime.toLocal());
  return formattedDate;
}

//Convert utc to 2323/10/21 this format
String convertUtcDateString(String? utcDateString) {
  // Parse the UTC date string into a DateTime object
  final utcDateTime = DateTime.parse(utcDateString.toString());
  // Format the DateTime object as "yyyy/MM/dd"
  final formatter = DateFormat('yMMMMd');
  final formattedDate = formatter.format(utcDateTime.toLocal());
  return formattedDate;
}

String assignmentRemainingTime(String? openDtae, String? dueDate){

  final openDateTime = DateTime.parse(openDtae.toString());
  final dueDateTime = DateTime.parse(dueDate.toString());
  final remainingDate = dueDateTime.difference(openDateTime);
  return remainingDate.inDays.toString();
}


//Date Calender picker
Future<void> showStartdatepicker(DateTime startSelectedDate) async {
  DateTime? pickDate = await showDatePicker(
    context: Get.context!,
    initialDate: startSelectedDate,
    firstDate: DateTime(2020),
    lastDate: DateTime(2025),
  );
  if (pickDate != null && pickDate != startSelectedDate) {
    startSelectedDate = pickDate;
  }
}

DateTime convertStringUtcToDateTime(String? utcDateString) {
  if (utcDateString == null) {
    return DateTime.now(); // or return any other default value as needed
  }

  final utcDateTime = DateTime.parse(utcDateString);
  return utcDateTime.toLocal();
}

