import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

extension ExtensionOnString on String {
  Uri parseUri(Map<String, dynamic>? params) {
    return Uri.parse(this).replace(
        queryParameters: params?.map((String key, dynamic value) =>
            MapEntry<String, dynamic>(key, value.toString())));
  }

  bool isEqual(String? value) {
    return toLowerCase() == value?.toLowerCase();
  }
}

extension ExtensionOnDouble on double? {
  String? toWindSpeed() {
    if (this != null) {
      return '${toString()}km/h';
    }
    return null;
  }

  String? toCelsius() {
    if (this != null) {
      final numberFormat = NumberFormat('###.##', 'en_US');
      final double value = this! - 237.15;
      return '${numberFormat.format(value)}°';
    }
    return null;
  }
}

extension ExtensionsOnInt on int? {
  String? fromTimestampToDate() {
    if (this != null) {
      // ignore: no_leading_underscores_for_local_identifiers
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat('dd-MM-yyyy').format(_date);
    }
    return null;
  }

  String? toKM() {
    if (this != null) {
      return '${(this! / 1000).round()}Km';
    }
    return null;
  }
}

extension ExtensionsOnHttpResponse on Response {
  dynamic decodeJson() {
    return jsonDecode(body);
  }
}
