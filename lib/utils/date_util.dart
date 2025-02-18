import 'package:flutter/material.dart';

import '/utils/navigation.dart';

class DateUtil {
  static Future<DateTime?> showDatePickerDialog() async {
    final picked = await showDatePicker(
      context: Navigation.key.currentContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, DateTime.december),
      lastDate: DateTime.now(),
    );

    return picked;
  }
}
