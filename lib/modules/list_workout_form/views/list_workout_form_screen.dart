import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '/global/widget/global_text.dart';
import '../../../data_provider/api_client.dart';
import '../../../global/widget/global_bottom_button.dart';
import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_textformfield.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/custom_file_picker.dart';
import '../../../utils/enum.dart';
import '../../../utils/navigation.dart';
import '../../../utils/styles/k_assets.dart';
import '../../../utils/styles/k_colors.dart';
import '../../../utils/view_util.dart';
import '../../list_training_form/views/list_training_form_screen.dart';
import '../../list_workout_modules/model/list_workout_detail.dart';
import '../model/list_workout_response.dart';

class ListWorkoutFormScreen extends StatefulWidget {
  final ListWorkoutData? data;

  const ListWorkoutFormScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<ListWorkoutFormScreen> createState() => _ListWorkoutFormScreenState();
}

class _ListWorkoutFormScreenState extends State<ListWorkoutFormScreen> {
  bool isButtonEnabled = false;
  File? featuredImage;
  List<File> images = [];

  String? featuredNetworkImage;
  List<CustomImage> networkImages = [];

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController gearsAndEquipments = TextEditingController();
  final TextEditingController enrollmentFees = TextEditingController();

  bool get isEdit => widget.data != null;
  bool showFeaturedImageFromNetwork = false;
  bool showListImageFromNetwork = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      title.addListener(checkButtonStatus);
      description.addListener(checkButtonStatus);
      note.addListener(checkButtonStatus);
      gearsAndEquipments.addListener(checkButtonStatus);
      enrollmentFees.addListener(checkButtonStatus);
      checkIsEdit();
    });
  }

  checkIsEdit() {
    if (isEdit) {
      title.text = widget.data?.title ?? '';
      description.text = widget.data?.description ?? '';
      note.text = widget.data?.notices ?? '';
      gearsAndEquipments.text = widget.data?.gearEquipment ?? '';
      enrollmentFees.text = widget.data?.enrollmentFee ?? '';

      featuredNetworkImage = widget.data?.image;
      networkImages = (widget.data?.galleryImages ?? [])
          .map((e) => CustomImage(path: e, imageFor: ImageFor.network))
          .toList();

      showFeaturedImageFromNetwork = featuredNetworkImage != null;
      showListImageFromNetwork = networkImages.isNotEmpty;
    }
  }

  void checkButtonStatus() {
    isButtonEnabled = isEdit
        ? true
        : featuredImage != null &&
            images.isNotEmpty &&
            title.text.trim().isNotEmpty &&
            description.text.trim().isNotEmpty &&
            note.text.trim().isNotEmpty &&
            gearsAndEquipments.text.trim().isNotEmpty;
    setState(() {});
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (showFeaturedImageFromNetwork) ...[
                          Stack(
                            children: [
                              InkWell(
                                onTap: featuredNetworkImage == null
                                    ? () {
                                        selectFeaturedImage();
                                      }
                                    : null,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: GlobalImageLoader(
                                    imagePath: featuredNetworkImage ?? "",
                                    height: 200.h,
                                    width: double.infinity,
                                    imageFor: ImageFor.network,
                                  ),
                                ),
                              ),
                              if (featuredNetworkImage != null)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      deleteImage(
                                        featuredNetworkImage!,
                                        onSuccess: () {
                                          showFeaturedImageFromNetwork = false;
                                          featuredNetworkImage = null;
                                          setState(() {});
                                        },
                                      );
                                      //removeFeaturedImage();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: KColor.white.color,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ] else ...[
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
                        ],
                        SizedBox(
                          height: 20.h,
                        ),
                        if (showListImageFromNetwork) ...[
                          SizedBox(
                            height: 100.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: networkImages.length + 1,
                              itemBuilder: (context, index) {
                                if (index < networkImages.length) {
                                  final image = networkImages[index];
                                  return Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        child: GlobalImageLoader(
                                          imagePath: image.path,
                                          height: 100.h,
                                          width: 100.w,
                                          imageFor: image.imageFor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.w,
                                          vertical: 6.h,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            if (image.imageFor ==
                                                ImageFor.network) {
                                              deleteImage(image.path,
                                                  onSuccess: () {
                                                removeNetworkImage(index);
                                              });
                                            } else {
                                              removeNetworkImage(index);
                                            }
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
                                    addNetworkImage();
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
                        ] else ...[
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
                                        borderRadius:
                                            BorderRadius.circular(4.r),
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
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _title("Workout Title"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: title,
                    ),
                    SizedBox(height: 10.h),
                    _title("Description"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: description,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    _title("Notes"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: note,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    _title("Gears and Equipments"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: gearsAndEquipments,
                      maxLines: 6,
                    ),
                    SizedBox(height: 10.h),
                    _title("Enrollment Fee (\$)"),
                    GlobalText(
                      str: "Leave this blank to make it free",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffC3C5CA).withOpacity(0.5),
                    ),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: enrollmentFees,
                      keyboardType: TextInputType.number,
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
                if (isEdit) {
                  updateWorkout();
                } else {
                  createWorkout();
                }

                //controller.saveArmsForm();
              }
            : null,
        buttonText: "Proceed to Next Steps",
      ),
    );
  }

  void removeNetworkImage(int index) {
    networkImages.removeAt(index);
    checkButtonStatus();
    setState(() {});
  }

  void addNetworkImage() async {
    if (networkImages.length >= 5) {
      ViewUtil.snackBar(
        "You can add maximum 5 images",
        context,
      );
      return;
    }
    final file = await pickImage();
    if (file != null) {
      networkImages.add(CustomImage(path: file.path, imageFor: ImageFor.file));
      checkButtonStatus();
      setState(() {});
    }
  }

  Future<void> deleteImage(
    String filePath, {
    required Function() onSuccess,
  }) async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: 'media/delete',
      method: Method.POST,
      params: {
        "service_type": 'workout',
        'id': widget.data?.id,
        "image_or_video": 'image',
        "file_path": filePath,
      },
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          onSuccess();
          ViewUtil.snackBar("Image Deleted", context);
        }
      },
    );
  }

  Widget _title(String text) {
    return GlobalText(
      str: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xffC3C5CA),
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
      ViewUtil.snackBar(
        "You can add maximum 5 images",
        context,
      );
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

  Future<void> createWorkout() async {
    ViewUtil.showLoaderPage();
    final map = {
      "title": title.text,
      "notes": note.text,
      "description": description.text,
      "enrollment_fee":
          enrollmentFees.text.trim().isEmpty ? null : enrollmentFees.text,
      "gear_equipment": gearsAndEquipments.text,
      // Files will be added separately
    };
    'here is: $map'.log();

    final formData = FormData.fromMap(map);

    // Add feature image
    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(
        featuredImage!.path, // Replace with actual file path
        filename: featuredImage!.path.split("/").last,
      ),
    ));

    final imagePaths = images.map((e) => e.path).toList();

    for (var path in imagePaths) {
      formData.files.add(MapEntry(
        'gallery_images[]', // Note: same key for multiple files
        await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
      ));
    }

    // formData.files.forEach((element) {
    //   'key: ${element.key}, value: ${element.value}'.log();
    // });

    await await ApiClient().request(
      url: "workout-services/store",
      method: Method.POST,
      params: formData,
      callback: (response, success) {
        ViewUtil.hideLoader();
        'response: ${jsonEncode(response?.data)}'.log();
        if (success && response != null) {
          final converted = ListWorkoutFormResponse.fromJson(response.data);
          ViewUtil.snackBar(
            "Workout created successfully",
            context,
          );
          Navigation.push(
            appRoutes: AppRoutes.listWorkoutModules,
            arguments: converted.data?.id,
          );
        }
      },
    );
  }

  Future<void> updateWorkout() async {
    ViewUtil.showLoaderPage();
    final map = {
      "title": title.text,
      "notes": note.text,
      "description": description.text,
      "enrollment_fee":
          enrollmentFees.text.trim().isEmpty ? null : enrollmentFees.text,
      "gear_equipment": gearsAndEquipments.text,
      // Files will be added separately
    };
    'here is: $map'.log();

    final formData = FormData.fromMap(map);

    // Add feature image
    if (featuredImage != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(
          featuredImage!.path, // Replace with actual file path
          filename: featuredImage!.path.split("/").last,
        ),
      ));
    }

    final imagePaths = images.map((e) => e.path).toList();

    for (var path in imagePaths) {
      formData.files.add(MapEntry(
        'gallery_images[]', // Note: same key for multiple files
        await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
      ));
    }

    // formData.files.forEach((element) {
    //   'key: ${element.key}, value: ${element.value}'.log();
    // });

    await await ApiClient().request(
      url: "workout-services/${widget.data?.id}/update",
      method: Method.POST,
      params: formData,
      callback: (response, success) {
        ViewUtil.hideLoader();
        'response: ${jsonEncode(response?.data)}'.log();
        if (success && response != null) {
          final converted = ListWorkoutFormResponse.fromJson(response.data);
          ViewUtil.snackBar(
            "Workout updated successfully",
            context,
          );
          Navigation.push(
            appRoutes: AppRoutes.listWorkoutModules,
            arguments: converted.data?.id,
          );
        }
      },
    );
  }
}
