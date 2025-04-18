import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/custom_file_picker.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../global/widget/global_bottom_button.dart';
import '../../../global/widget/global_bottomsheet_textformfield.dart';
import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../utils/enum.dart';
import '../../../utils/styles/k_colors.dart';
import '../../../utils/view_util.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListTrainingFormScreen extends StatefulWidget {
  const ListTrainingFormScreen({super.key});

  @override
  State<ListTrainingFormScreen> createState() => _ListTrainingFormScreenState();
}

class _ListTrainingFormScreenState extends State<ListTrainingFormScreen> {
  File? featuredImage;
  List<File> images = [];
  final TextEditingController title = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController preRequisite = TextEditingController();
  final TextEditingController maxEnrollment = TextEditingController();
  final TextEditingController enrollmentFees = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      title.addListener(checkButtonStatus);
      location.addListener(checkButtonStatus);
      description.addListener(checkButtonStatus);
      preRequisite.addListener(checkButtonStatus);
      maxEnrollment.addListener(checkButtonStatus);
      enrollmentFees.addListener(checkButtonStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Trainings",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: featuredImage == null
                                  ? () {
                                      selectFeaturedImage();
                                    }
                                  : null,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: GlobalImageLoader(
                                  imagePath: featuredImage != null
                                      ? featuredImage!.path
                                      : KAssetName.addPhoto1Png.imagePath,
                                  height: 200.h,
                                  width: double.infinity,
                                  imageFor: featuredImage != null
                                      ? ImageFor.file
                                      : ImageFor.asset,
                                ),
                              ),
                            ),
                            if (featuredImage != null)
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    removeFeaturedImage();
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: KColor.white.color,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length + 1,
                            itemBuilder: (context, index) {
                              if (index < images.length) {
                                final image = images[index];
                                return Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: GlobalImageLoader(
                                        imagePath: image.path,
                                        height: 100.h,
                                        width: 100.w,
                                        imageFor: ImageFor.file,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 6.h,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          removeImage(index);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: KColor.white.color,
                                          size: 18.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  addImage();
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: GlobalImageLoader(
                                    imagePath:
                                        KAssetName.addPhoto2Png.imagePath,
                                    height: 100.h,
                                    width: 100.w,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10.w,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _title("Training Title"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: title,
                    ),
                    SizedBox(height: 10.h),
                    _title("Location"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: location,
                      readOnly: true,
                      focusNode: AlwaysDisabledFocusNode(),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: KColor.primary.color,
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: Center(
                                child: GlobalText(
                                  str: "Open Maps",
                                  color: KColor.white.color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _title("Description"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: description,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    _title("Pre-requisitions"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: preRequisite,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    _title("Max Enrollment"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(textEditingController: maxEnrollment),
                    SizedBox(height: 10.h),
                    _title("Enrollment Fee (\$)"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: enrollmentFees,
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: isButtonEnabled
            ? () {
                //controller.saveArmsForm();
              }
            : null,
        buttonText: "Proceed to Next Steps",
      ),
    );
  }

  Widget _title(String text) {
    return GlobalText(
      str: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: KColor.grey.color,
    );
  }

  Future<void> selectFeaturedImage() async {
    final file = await pickImage();
    if (file != null) {
      featuredImage = file;
      checkButtonStatus();
      setState(() {});
    }
  }

  Future<File?> pickImage() async {
    File? _file;
    await CustomFilePicker.pickSingleFile(
      extensions: [
        'jpg',
        'jpeg',
        'png',
      ],
      onSuccess: (file) {
        _file = file;
      },
    );
    return _file;
  }

  void removeFeaturedImage() {
    featuredImage = null;
    checkButtonStatus();
    setState(() {});
  }

  void addImage() async {
    if (images.length >= 5) {
      ViewUtil.snackBar("You can add maximum 5 images");
      return;
    }
    final file = await pickImage();
    if (file != null) {
      images.add(file);
      checkButtonStatus();
      setState(() {});
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    checkButtonStatus();
    setState(() {});
  }

  void checkButtonStatus() {
    isButtonEnabled = featuredImage != null &&
        images.isNotEmpty &&
        title.text.trim().isNotEmpty &&
        location.text.trim().isNotEmpty &&
        description.text.trim().isNotEmpty &&
        preRequisite.text.trim().isNotEmpty &&
        maxEnrollment.text.trim().isNotEmpty &&
        enrollmentFees.text.trim().isNotEmpty;
    setState(() {});
  }
}
