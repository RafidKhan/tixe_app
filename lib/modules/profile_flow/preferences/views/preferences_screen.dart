import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/profile_flow/preferences/views/components/preference_notifications.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../controller/preferences_controller.dart';
import 'components/preference_measurement_units.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(preferencesController.notifier);
    Future(() {
      controller.loadUnitData().then((value) {
        final sharedCon = context.read(sharedController.notifier);
        final notificationStatus = sharedCon
            .getProfileDataFromState()
            ?.data
            ?.profileDetails
            ?.notificationEnabled;
        controller.setNotificationStatus(currentStatus: notificationStatus);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(preferencesController.notifier);

    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Preferences",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PreferenceMeasurementUnits(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const PreferenceNotifications(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final state = ref.watch(preferencesController);
        return GlobalBottomButton(
          onPressed: state.isButtonEnabled
              ? () {
                  controller.savePreference(context);
                }
              : null,
          buttonText: "Save Changes",
        );
      }),
    );
  }
}
