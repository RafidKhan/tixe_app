import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tixe_flutter_app/constant/constant_key.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

mixin GlobalMixin {
  String calculateDiscount({
    required String mainAmount,
    required String discountType,
    required String discountValue,
  }) {
    try {
      final num mainAmountNum = num.parse(mainAmount);
      final num discountValueNum = num.parse(discountValue);
      if (discountType.toLowerCase() == AppConstant.FLAT_DISCOUNT.key) {
        final result = (mainAmountNum - discountValueNum)
            .clamp(0, double.infinity)
            .toStringAsFixed(2)
            .toString();
        return result;
      } else if (discountType.toLowerCase() ==
          AppConstant.PERCENTAGE_DISCOUNT.key) {
        final num discount = (mainAmountNum * discountValueNum) / 100;
        final result = (mainAmountNum - discount)
            .clamp(0, double.infinity)
            .toStringAsFixed(2)
            .toString();
        return result;
      } else {
        return mainAmountNum.toString();
      }
    } catch (e) {
      return mainAmount;
    }
  }

  Future<File?> downloadFile({
    required String url,
  }) async {
    try {
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);

      Directory? downloadsDirectory;
      if (Platform.isAndroid) {
        downloadsDirectory = Directory('/storage/emulated/0/Download');
      } else {
        downloadsDirectory = await getDownloadsDirectory();
      }

      if (downloadsDirectory != null) {
        final File file = File("${downloadsDirectory.path}/$filename");

        await file.writeAsBytes(bytes, flush: true);
        return file;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
