import 'package:flutter/material.dart';

import '/utils/navigation.dart';

class DateUtil {
  static Future<DateTime?> showDatePickerDialog({
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final picked = await showDatePicker(
      context: Navigation.key.currentContext!,
      //initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(2015, DateTime.december),
      lastDate: lastDate ?? DateTime.now(),
    );

    return picked;
  }
}
