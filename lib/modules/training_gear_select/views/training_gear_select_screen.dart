import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_arms/model/my_listed_arms_model.dart';
import 'package:tixe_flutter_app/modules/list_arms/repository/list_arms_interface.dart';
import 'package:tixe_flutter_app/modules/list_arms/repository/list_arms_repository.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';
import '../../../utils/enum.dart';
import '../../../utils/styles/k_colors.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class TrainingGearSelectScreen extends StatefulWidget {
  final int trainingId;

  const TrainingGearSelectScreen({
    super.key,
    required this.trainingId,
  });

  @override
  State<TrainingGearSelectScreen> createState() =>
      _TrainingGearSelectScreenState();
}

class _TrainingGearSelectScreenState extends State<TrainingGearSelectScreen> {
  final IListArmsRepository _listarmsRepository = ListArmsRepository();

  List<MyListedArm> myArms = [];

  Future<void> getArms() async {
    ViewUtil.showLoaderPage();
    await _listarmsRepository.getMyArms(
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final arms = response?.data ?? [];
          myArms = arms.map((e) {
            return MyListedArm(
              id: e.id,
              title: e.title ?? "",
              description: e.description ?? "",
              price: e.price ?? "",
              renting: e.rentalOption == "1",
              image: e.featureImage ?? "",
            );
          }).toList();

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
      getArms();
    });
  }

  bool isBtnEnabled = false;

  checkBtnStatus() {
    isBtnEnabled = myArms.any((arm) => arm.isSelected);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Gears Checklist",
          ),
          Expanded(
            child: ListView.separated(
              itemCount: myArms.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (context, index) {
                final arm = myArms[index];
                return armItem(
                  arm,
                  onTap: () {
                    checkBtnStatus();
                  },
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: isBtnEnabled
            ? () {
                confirmGears();
              }
            : null,
        buttonText: "Confirm Gears",
      ),
    );
  }

  Future<void> confirmGears() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "training-services/${widget.trainingId}/gear-set",
      method: Method.POST,
      params: {
        "gear_ids":
            myArms.where((arm) => arm.isSelected).map((arm) => arm.id).toList(),
      },
      callback: (rsp, success) {
        ViewUtil.hideLoader();
        if (success) {
          Navigation.pop(
            result: myArms.where((arm) => arm.isSelected).toList(),
          );
        }
      },
    );
  }

  Widget armItem(
    MyListedArm arm, {
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: KColor.darkGrey.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  arm.isSelected = !arm.isSelected;
                  setState(() {});
                  onTap();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: arm.isSelected ? 0 : 5.w,
                    bottom: arm.isSelected ? 0 : 10.h,
                    right: arm.isSelected ? 2.w : 6.w,
                  ),
                  child: GlobalImageLoader(
                    imagePath: arm.isSelected
                        ? KAssetName.selectedCheckBoxPng.imagePath
                        : KAssetName.unSelectedCheckboxPng.imagePath,
                    height: arm.isSelected ? 30.h : 20.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: GlobalText(
                  str: arm.title,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            decoration: BoxDecoration(
              color: KColor.darkGrey2.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                GlobalImageLoader(
                  imagePath: arm.image,
                  height: 84.h,
                  width: 120.w,
                  imageFor: ImageFor.network,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
