import 'dart:io';

import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../constant/constant_key.dart';
import 'health_data_types.dart';

class UserActivityTrack {
  static void init() {
    {
      _permissions = _types.map((e) => HealthDataAccess.READ).toList();
      "permissions are : $_permissions".log();
    }
  }

  static final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: true);

  static List<HealthDataAccess> _permissions = [];

  static final List<HealthDataType> _types =
      Platform.isAndroid ? dataTypesAndroid : dataTypesIOS;

  static Future<void> authorize() async {
    // If we are trying to read Step Count, Workout, Sleep or other data that requires
    // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
    // This requires a special request authorization call.
    //
    await Permission.activityRecognition.request();

    // The location permission is requested for Workouts using the Distance information.
    // await Permission.location.request();
    // await Permission.ignoreBatteryOptimizations.request();

    bool? hasPermissions =
        await _health.hasPermissions(_types, permissions: _permissions);

    "haspermission is : $hasPermissions".log();

    hasPermissions = false;

    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized = await _health.requestAuthorization(_types,
            permissions: _permissions);
        "authorization is : $authorized".log();
        await setPreference(authorized);
      } catch (error) {
        await setPreference(false);
      }
    }
  }

  static Future<void> removeAccess() async {
    try {
      if (!Platform.isIOS) {
        await _health.revokePermissions();
        await setPreference(false);
      }
    } catch (e) {
      await setPreference(true);
    }
  }

  static Future<void> setPreference(bool value) async {
    await PrefHelper.setBool(
      AppConstant.SYNCED_WITH_HEALTH_TRACKER.key,
      value,
    );
  }

  static bool isSyncedWithTracker() {
    return PrefHelper.getBool(AppConstant.SYNCED_WITH_HEALTH_TRACKER.key);
  }

  static removeAccessIfSynced() {
    if (isSyncedWithTracker() == true) {
      removeAccess();
    }
  }

  static Future<List<HealthDataPoint>> fetchSpecificData(
    HealthDataType type, {
    DateTime? startDateTimeValue,
    DateTime? endDateTimeValue,
  }) async {
    if (isSyncedWithTracker() == true) {
      List<HealthDataPoint> healthDataList = [];
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      healthDataList.clear();

      try {
        List<HealthDataPoint> getData =
            await _health.getHealthDataFromTypes(startTime, endTime, [type]);

        healthDataList.addAll(getData);
      } catch (error) {
        healthDataList = [];
      }
      healthDataList = HealthFactory.removeDuplicates(healthDataList);

      return healthDataList;
    }
    {
      return [];
    }
  }

  static Future<List<HealthDataPoint>> fetchForDashboardData({
    DateTime? startDateTimeValue,
    DateTime? endDateTimeValue,
  }) async {
    if (isSyncedWithTracker() == true) {
      List<HealthDataPoint> healthDataList = [];
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      try {
        if (Platform.isIOS) {
          healthDataList =
              await _health.getHealthDataFromTypes(startTime, endTime, [
            HealthDataType.ACTIVE_ENERGY_BURNED,
            HealthDataType.DISTANCE_WALKING_RUNNING,
          ]);
        } else {
          "start time is : $startTime && end time is : $endTime".log();
          healthDataList =
              await _health.getHealthDataFromTypes(startTime, endTime, [
            HealthDataType.ACTIVE_ENERGY_BURNED,
            HealthDataType.DISTANCE_DELTA,
          ]);
        }
      } catch (error) {
        healthDataList = [];
      }
      healthDataList = HealthFactory.removeDuplicates(healthDataList);

      return healthDataList;
    } else {
      return [];
    }
  }

  static Future<dynamic> fetchAllData({
    DateTime? startDateTimeValue,
    DateTime? endDateTimeValue,
    required Function(num value) stepsResult,
    required Function(num value) caloriesResult,
    required Function(num value) exerciseTimeResult,
    required Function(num value) heartRateResult,
    required Function(num value) sleepResult,
    required Function(List<HealthDataPoint> exerciseList) exerciseListResult,
  }) async {
    if (isSyncedWithTracker() == true) {
      List<HealthDataPoint> healthDataList = [];
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      try {
        healthDataList = await _health.getHealthDataFromTypes(
          startTime,
          endTime,
          Platform.isAndroid ? dataTypesAndroid : dataTypesIOS,
        );

        healthDataList = HealthFactory.removeDuplicates(healthDataList);

        num caloriesBurnt = 0.0;
        num steps = 0;
        num totalExerciseTime = 0;
        num totalSleepTime = 0;

        healthDataList.forEach((element) {
          num _calorie = 0;
          if (element.value.toJson()['numericValue'] != null) {
            _calorie = num.tryParse(
                    element.value.toJson()['numericValue'].toString()) ??
                0;
          } else if (element.value.toJson()['totalEnergyBurned'] != null) {
            _calorie = num.tryParse(
                    element.value.toJson()['totalEnergyBurned'].toString()) ??
                0;
          }

          caloriesBurnt = caloriesBurnt + _calorie;

          if (element.type == HealthDataType.WORKOUT) {
            final duration = element.dateTo.difference(element.dateFrom);
            totalExerciseTime += duration.inMinutes;
          }

          if (element.type == HealthDataType.STEPS) {
            final num _steps = num.tryParse(element.value.toString()) ?? 0;

            steps = steps + _steps;
          }

          if (element.type == HealthDataType.SLEEP_ASLEEP || element.type == HealthDataType.SLEEP_IN_BED || element.type == HealthDataType.SLEEP_DEEP || element.type == HealthDataType.SLEEP_LIGHT || element.type == HealthDataType.SLEEP_REM || element.type == HealthDataType.SLEEP_SESSION || element.type == HealthDataType.SLEEP_OUT_OF_BED) {
            final duration = element.dateTo.difference(element.dateFrom);
            totalSleepTime += duration.inHours;
          }
        });

        final lastHeartInfo = healthDataList
            .where((e) => e.type == HealthDataType.HEART_RATE)
            .lastOrNull;
        final num heartRate = lastHeartInfo == null
            ? 0
            : num.tryParse(lastHeartInfo.value.toString()) ?? 0;
        caloriesResult(caloriesBurnt);
        stepsResult(steps);
        exerciseTimeResult(totalExerciseTime);
        heartRateResult(heartRate);
        exerciseListResult(healthDataList
            .where((e) => e.type == HealthDataType.WORKOUT)
            .toList());
        sleepResult(totalSleepTime);

        // 'here is:DATA: ${jsonEncode(healthStoreModel.payload?.toMap())} ****'
        //     .log();

        //return healthStoreModel;
        // if (resultMap.containsKey(selectedPatientId)) {
        //   // Retrieve the DateTime for the patient ID
        //   resultMap[selectedPatientId] = endTime;
        // }

        // "Now resultmap is : $resultMap".log();
        //
        // Map<String, String> convertedResultMap = resultMap.map(
        //     (key, value) => MapEntry(key.toString(), value.toIso8601String()));
        //
        // String encodedMap = json.encode(convertedResultMap);
        // PrefHelper.setString(AppConstant.LAST_SYNCED_TIMES.key, encodedMap);
      } catch (error) {
        healthDataList = [];
      }
    }
  }

  static Future<int> fetchStepsData({
    DateTime? startDateTimeValue,
    DateTime? endDateTimeValue,
  }) async {
    if (isSyncedWithTracker() == true) {
      int steps = 0;
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      "fetchStepsData : start time is : $startTime && end time is : $endTime"
          .log();
      try {
        steps =
            (await _health.getTotalStepsInInterval(startTime, endTime)) ?? 0;
      } catch (error) {
        steps = 0;
      }
      "method steps data is : $steps".log();
      return steps;
    }
    {
      return 0;
    }
  }

  static Future<double> fetchCalorieDataForAndroid({
    DateTime? startDateTimeValue,
    DateTime? endDateTimeValue,
  }) async {
    if (isSyncedWithTracker() == true) {
      double calorie = 0;
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      "fetchCalorieData : start time is : $startTime && end time is : $endTime"
          .log();

      try {
        calorie =
            (await _health.getTotalCaloriesInInterval(startTime, endTime)) ?? 0;
      } catch (error) {
        calorie = 0;
      }

      "method calorie data is : $calorie".log();
      return calorie;
    }
    {
      return 0;
    }
  }
}
