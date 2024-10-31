import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertDate(String? date) {
  String inputDateString = date!;

  // Parse the input string
  DateTime inputDate = DateFormat("MMM d, y").parse(inputDateString);

  // Format the date in the desired format: 10 Jan, 2024
  String formattedDate = DateFormat("d MMM, y").format(inputDate);
  return formattedDate;
}

String? dateDifferenceBetween(String? date) {
  String dateStr = date!;
  //DateTime givenDate = DateFormat("yyyy-MM-dd").parse(dateStr);
  DateTime givenDate = DateFormat.yMMMMd('en_US').parse(dateStr);

  DateTime currentDate = DateTime.now();
  int differenceInDays = currentDate.difference(givenDate).inDays;
  String newString = "";

  if (differenceInDays == 0) {
    newString = "Today";
  } else if (differenceInDays == 1) {
    newString = "Yesterday";
  } else {
    newString = "$differenceInDays Day's ago";
  }
  return newString;

  ///
}

String? timeDifferenceConvert(
  String? date,
  String? time,
) {
  String dateTimeString = "$date $time";

  // Parse the given datetime string
  DateTime parsedDateTime =
      DateFormat("MMM d, yyyy h:mm a").parse(dateTimeString);
  DateTime currentDateTime = DateTime.now();
  Duration difference = currentDateTime.difference(parsedDateTime);
  String formattedDifference = "";
  if (difference.inDays > 0) {
    formattedDifference = "${difference.inDays} d ago";
  } else if (difference.inHours > 0) {
    formattedDifference = "${difference.inHours} h ago";
  } else if (difference.inMinutes > 0) {
    formattedDifference = "${difference.inMinutes} min ago";
  } else {
    formattedDifference = "Just now";
  }

  return formattedDifference;
}

bool? checkFavOrNot(
  List<dynamic>? favList,
  String? bookId,
) {
  bool value = false;
  if (favList != null && favList.isNotEmpty) {
    for (var element in favList) {
      if (element["bookDetails"]["_id"].toString() == bookId!.toString()) {
        value = true;
        break;
      }
    }
  } else {
    value = false;
  }
  return value;
}

String capitalizeFirst(String input) {
  if (input.isEmpty) return input; // Return input if it's empty

  // Capitalize first character and convert rest to lowercase
  return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
}

String convertToTwoDigitDecimal(String numberStr) {
  // Round the number to 2 decimal places
  double number = double.parse(numberStr);
  return number.toStringAsFixed(2);
}

String? expiresFormate(String inputDate) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(inputDate);

  // Format the date to "d MMM yyyy" format
  String formattedDate = DateFormat("d MMM yyyy").format(date);

  return formattedDate;
}
