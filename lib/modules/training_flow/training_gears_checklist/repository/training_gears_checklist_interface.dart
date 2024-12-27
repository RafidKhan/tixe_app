import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ITrainingGearsChecklistRepository {
  Future<void> getGears({
    required Function(Response? response, bool isSuccess) callback,
  });
}




