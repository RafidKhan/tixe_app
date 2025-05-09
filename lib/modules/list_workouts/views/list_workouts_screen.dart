import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_workouts/views/components/no_workout.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/styles/k_colors.dart';
import '../model/list_workouts_response.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutsScreen extends StatefulWidget {
  const ListWorkoutsScreen({Key? key}) : super(key: key);

  @override
  State<ListWorkoutsScreen> createState() => _ListWorkoutsScreenState();
}

class _ListWorkoutsScreenState extends State<ListWorkoutsScreen> {
  List<ListWorkout> workouts = [];

  Future<void> getWorkouts() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "list/workout-services",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          workouts = ListWorkoutsResponse.fromJson(response?.data).data ?? [];
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getWorkouts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Workouts",
          ),
          workouts.isEmpty
              ? const Expanded(
                  child: Center(
                    child: NoWorkout(),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GlobalButton(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          onPressed: () {
                            Navigation.push(
                              appRoutes: AppRoutes.listWorkoutForm,
                            );
                          },
                          buttonText: "List New Workout",
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          itemBuilder: (context, index) {
                            final data = workouts[index];
                            return trainingItem(data);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemCount: workouts.length,
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget trainingItem(ListWorkout data) {
    final context = Navigation.key.currentContext!;
    final bool isFree = (data.isPremium != true);

    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        // Navigation.push(
        //   appRoutes: AppRoutes.myListedTrainingDetail,
        //   arguments: data.id,
        // ).then((value) {
        //   //controller.getArms();
        // });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.cardGradient1.color,
              KColor.cardGradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color:
                isFree ? KColor.transparent.color : KColor.white.color,
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(
                  color: isFree
                      ? KColor.white.color
                      : KColor.transparent.color,
                ),
              ),
              child: GlobalText(
                str: isFree
                    ? context.loc.free
                    : "\$${data.enrollmentFee}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isFree ? KColor.white.color : KColor.black.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: data.title ?? "",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  GlobalText(
                    str: "Workout",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.secondary.color,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const GlobalDivider(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: data.description ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: KColor.white.color,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                  width: context.width,
                  child: GlobalImageLoader(
                    imagePath: data.image ?? "",
                    height: 130.h,
                    width: context.width,
                    fit: BoxFit.fitWidth,
                    imageFor: ImageFor.network,
                    //imageFor: ImageFor.network,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
