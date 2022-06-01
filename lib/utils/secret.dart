import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';

class SecretUtils {
  static Future<String> generate(String secret) async {
    var device = (await DeviceInfoPlugin().deviceInfo).toMap();

    if (device.containsKey("machineId")) {
      secret += device["machineId"].toString();
    } else if (device.containsKey("systemGUID")) {
      secret += device["systemGUID"].toString();
    } else if (device.containsKey("androidId")) {
      secret += device["androidId"].toString();
    } else if (device.containsKey("identifierForVendor")) {
      secret += device["identifierForVendor"].toString();
    } else if (device.containsKey("userAgent")) {
      secret += device["userAgent"].toString();
    }

    return md5.convert(utf8.encode(secret)).toString().substring(0, 12);
  }
}
