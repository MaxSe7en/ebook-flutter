// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    // Check if identifierForVendor is not null
    if (iosDeviceInfo.identifierForVendor != null) {
      return iosDeviceInfo.identifierForVendor!;
    } else {
      // Handle case where identifierForVendor is null
      return "Unknown iOS device ID";
    }
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    // Check if id is not null
    if (androidDeviceInfo.id != null) {
      return androidDeviceInfo.id!;
    } else {
      // Handle case where id is null
      return "Unknown Android device ID";
    }
  }

  // Handle other platforms if needed
  return "Unknown device ID";
}
