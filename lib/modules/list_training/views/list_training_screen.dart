import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_training/views/components/no_training.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../data_provider/api_client.dart';
import '../../../global/widget/global_divider.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_text.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/navigation.dart';
import '../../../utils/styles/k_colors.dart';
import '../model/my_listed_trainings_response.dart';

class ListTrainingScreen extends StatefulWidget {
  const ListTrainingScreen({super.key});

  @override
  State<ListTrainingScreen> createState() => _ListTrainingScreenState();
}

class _ListTrainingScreenState extends State<ListTrainingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getTrainings();
    });
  }

  List<MyTraining> trainings = [];

  Future<void> getTrainings() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "new/training-services/list",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final converted = MyListedTrainingsResponse.fromJson(response?.data);
          trainings = converted.data ?? [];
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          GlobalHeaderWidget(
            title: "Listing Trainings",
          ),
          trainings.isEmpty
              ? Expanded(
                  child: Center(
                    child: NoTraining(
                      onBack: () {
                        getTrainings();
                      },
                    ),
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
                                    appRoutes: AppRoutes.listTrainingForm)
                                .then((value) {
                              getTrainings();
                            });
                          },
                          buttonText: "List New Training",
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          itemBuilder: (context, index) {
                            final data = trainings[index];
                            return trainingItem(data);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemCount: trainings.length,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget trainingItem(MyTraining data) {
    final context = Navigation.key.currentContext!;
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        Navigation.push(
          appRoutes: AppRoutes.myListedTrainingDetail,
          arguments: data.id,
        ).then((value) {
          //controller.getArms();
        });
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
                color: KColor.white.color,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: GlobalText(
                str: "\$${data.enrollmentFee ?? 0}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: KColor.black.color,
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
                    str: "Training",
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
