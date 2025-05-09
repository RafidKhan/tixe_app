import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_workout_modules_data/model/list_workout_modules.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../global/widget/global_divider.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/styles/styles.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutModulesDataScreen extends StatefulWidget {
  final int id;

  const ListWorkoutModulesDataScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListWorkoutModulesDataScreen> createState() =>
      _ListWorkoutModulesDataScreenState();
}

class _ListWorkoutModulesDataScreenState
    extends State<ListWorkoutModulesDataScreen> {
  ListWorkoutModules? data;

  Future<void> getData() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "workout-services/${widget.id}/show-modules",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          data = ListWorkoutModules.fromJson(response?.data);
          setState(() {});
          // Handle success
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final phases = data?.data ?? [];
    return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const GlobalHeaderWidget(
              title: "Workout Modules",
            ),
            Expanded(
              child: ListView.separated(
                itemCount: phases.length,
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 20.h,
                  left: 20.w,
                  right: 20.w,
                ),
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: const GlobalDivider(),
                  );
                },
                itemBuilder: (context, index) {
                  final phase = phases[index];
                  return _item(phase);
                },
              ),
            )
          ],
        ));
  }

  Widget _item(PhaseData phase) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GlobalText(
                str: phase.title ?? "",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GlobalImageLoader(
              imagePath: KAssetName.icClockPng.imagePath,
              height: 9.h,
            ),
            SizedBox(
              width: 6.w,
            ),
            GlobalText(
              str: "${(phase.durationTime ?? "0")} ${context.loc.minute}",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            if (phase.isCompleted == 1) ...[
              Container(
                margin: EdgeInsets.only(left: 6.w),
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  color: KColor.green.color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.done,
                  color: KColor.white.color,
                  size: 12.sp,
                ),
              ),
            ],
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: GlobalImageLoader(
                    imagePath: phase.type == "video"
                        ? KAssetName.tixeLogoPng.imagePath
                        : KAssetName.pdfPlaceholderPng.imagePath,
                    height: 85.h,
                    width: 85.w,
                  ),
                ),
                if (phase.type == "video")
                  Center(
                    child: GlobalImageLoader(
                      imagePath: KAssetName.icVideoPlayPng.imagePath,
                      height: 28.h,
                      width: 28.w,
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: GlobalText(
                str: phase.description ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        )
      ],
    );
  }
}
