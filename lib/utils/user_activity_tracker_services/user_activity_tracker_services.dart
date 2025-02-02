import 'dart:developer';
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
  }) async {
    if (isSyncedWithTracker() == true) {
      // String fetchedMap = PrefHelper.getString(
      //   AppConstant.LAST_SYNCED_TIMES.key,
      // );
      // final jsonMap = json.decode(fetchedMap);
      //
      // Map<int, DateTime> resultMap = {
      //   for (var key in jsonMap.keys)
      //     int.parse(key): DateTime.parse(jsonMap[key]!)
      // };
      //
      // print("decoded map is : $resultMap");

      // int selectedPatientId =
      //     await PrefHelper.getInt(AppConstant.PATIENT_ID.key);

      // if (resultMap.containsKey(selectedPatientId)) {
      //   // Retrieve the DateTime for the patient ID
      //   startTimeValue = resultMap[selectedPatientId];
      // }

      "fetch all health data called".log();
      List<HealthDataPoint> healthDataList = [];
      final List<HealthDataPoint> healthDataListActivity = [];
      final List<HealthDataPoint> healthDataListWorkout = [];
      final endTime = endDateTimeValue ?? DateTime.now();
      final startTime = (startDateTimeValue != null &&
              startDateTimeValue.compareTo(DateTime.now()) < 0)
          ? startDateTimeValue
          : DateTime(endTime.year, endTime.month, endTime.day);

      "starttime is : $startTime".log();
      try {
        healthDataList = await _health.getHealthDataFromTypes(
          startTime,
          endTime,
          Platform.isAndroid ? dataTypesAndroid : dataTypesIOS,
        );

        healthDataList = HealthFactory.removeDuplicates(healthDataList);

        double tempValue = 0.0;
        healthDataList.forEach((element) {
          log("""From date is : ${element.dateFrom} & End date is : ${element.dateTo} """);
          if (element.type == HealthDataType.WORKOUT) {
            healthDataListWorkout.add(element);
          } else {
            if (element.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
              tempValue = tempValue + double.parse(element.value.toString());
            }
            healthDataListActivity.add(element);
          }
        });

        // final HealthStoreModel healthStoreModel = HealthStoreModel(
        //   patientId: PrefHelper.getInt(AppConstant.PATIENT_ID.key).toString(),
        // );

        List<Map<String, dynamic>> mapListActivity = [];
        healthDataListActivity.forEach((element) {
          mapListActivity.add(element.toJson());
        });

        List<Map<String, dynamic>> mapListWorkout = [];
        healthDataListWorkout.forEach((element) {
          mapListWorkout.add(element.toJson());
        });
        // healthStoreModel.payload = PayloadData();
        // healthStoreModel.payload?.activity = mapListActivity;
        // healthStoreModel.payload?.workout = mapListWorkout;

        print("calories are : $tempValue");

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
