import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_training_form/model/training_pre_requisitions_response.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/custom_file_picker.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '/global/widget/global_text.dart';
import '../../../global/widget/global_bottom_button.dart';
import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../utils/enum.dart';
import '../../../utils/styles/k_colors.dart';
import '../../../utils/view_util.dart';
import '../../my_listed_training_detail/model/list_training_details.dart';
import '../model/create_training_response.dart';

class ListTrainingFormScreen extends StatefulWidget {
  final ListTrainingDetails? details;

  const ListTrainingFormScreen({
    super.key,
    this.details,
  });

  @override
  State<ListTrainingFormScreen> createState() => _ListTrainingFormScreenState();
}

class _ListTrainingFormScreenState extends State<ListTrainingFormScreen> {
  File? featuredImage;
  String? featuredNetworkImage;
  List<File> images = [];
  List<CustomImage> networkImages = [];
  List<int> selectedPreRequisitionIds = [];
  final TextEditingController title = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController preRequisite = TextEditingController();
  final TextEditingController maxEnrollment = TextEditingController();
  final TextEditingController enrollmentFees = TextEditingController();

  bool isButtonEnabled = false;

  List<PreRequisition> preRequisitions = [];

  bool isEdit = false;
  bool showFeaturedImageFromNetwork = false;
  bool showListImageFromNetwork = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() async {
      await getPrerequisites();
      title.addListener(checkButtonStatus);
      location.addListener(checkButtonStatus);
      description.addListener(checkButtonStatus);
      preRequisite.addListener(checkButtonStatus);
      maxEnrollment.addListener(checkButtonStatus);
      enrollmentFees.addListener(checkButtonStatus);
      checkIsEdit();
    });
  }

  void checkIsEdit() {
    isEdit = widget.details != null;
    if (isEdit) {
      final data = widget.details?.data?.trainingService;
      title.text = data?.title ?? "";
      location.text = data?.address ?? "";
      description.text = data?.description ?? "";
      preRequisite.text =
          data?.prerequisites?.map((e) => e.title).toList().join(",\n\n") ?? "";
      maxEnrollment.text = data?.maxEnrollment.toString() ?? "";
      enrollmentFees.text = data?.enrollmentFee.toString() ?? "";
      data?.prerequisites?.forEach((element) {
        if (element.id != null) {
          selectedPreRequisitionIds.add(element.id!);
        }
      });
      preRequisitions.forEach((e) {
        if (selectedPreRequisitionIds.contains(e.id)) {
          e.isSelected = true;
        } else {
          e.isSelected = false;
        }
      });

      featuredNetworkImage = data?.image;
      networkImages = (data?.galleryImages ?? [])
          .map((e) => CustomImage(path: e, imageFor: ImageFor.network))
          .toList();

      showFeaturedImageFromNetwork = featuredNetworkImage != null;
      showListImageFromNetwork = networkImages.isNotEmpty;
    }
    setState(() {});
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
                        if (showFeaturedImageFromNetwork) ...[
                          Stack(
                            children: [
                              InkWell(
                                onTap: featuredNetworkImage == null
                                    ? () {
                                        showFeaturedImageFromNetwork = false;
                                        selectFeaturedImage();
                                      }
                                    : null,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: GlobalImageLoader(
                                    imagePath: featuredNetworkImage != null
                                        ? featuredNetworkImage!
                                        : KAssetName.addPhoto1Png.imagePath,
                                    height: 200.h,
                                    width: double.infinity,
                                    imageFor: featuredNetworkImage != null
                                        ? ImageFor.network
                                        : ImageFor.asset,
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
                                      // featuredNetworkImage = null;
                                      // setState(() {});
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
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // ViewUtil.bottomSheet(
                              //   content: CustomLocationPicker(
                              //     onPicked: (value) async {
                              //       'value is: ${value.addressName}'.log();
                              //       //Navigation.pop();
                              //       //setLocation(value.address);
                              //       // Future.delayed(
                              //       //     const Duration(milliseconds: 100), () {
                              //       //   FocusScope.of(context).unfocus();
                              //       // });
                              //     },
                              //   ),
                              // );
                            },
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
                      readOnly: true,
                      suffixIcon: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ListPrerequieites(
                              preRequisitions: preRequisitions,
                              onSelect: (items) {
                                preRequisite.text = items
                                    .map((e) => e.title)
                                    .toList()
                                    .join(",\n\n");
                                selectedPreRequisitionIds =
                                    items.map((e) => e.id ?? 0).toList();
                                setState(() {});
                              },
                            ),
                          );
                        },
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _title("Max Enrollment"),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: maxEnrollment,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10.h),
                    _title("Enrollment Fee (\$)"),
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
                  updateTraining();
                } else {
                  createTraining();
                }

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

  void removeImage(int index) {
    images.removeAt(index);
    checkButtonStatus();
    setState(() {});
  }

  void removeNetworkImage(int index) {
    networkImages.removeAt(index);
    checkButtonStatus();
    setState(() {});
  }

  void checkButtonStatus() {
    isButtonEnabled = isEdit
        ? true
        : featuredImage != null &&
            images.isNotEmpty &&
            title.text.trim().isNotEmpty &&
            location.text.trim().isNotEmpty &&
            description.text.trim().isNotEmpty &&
            preRequisite.text.trim().isNotEmpty &&
            maxEnrollment.text.trim().isNotEmpty &&
            enrollmentFees.text.trim().isNotEmpty;
    setState(() {});
  }

  setLocation(String address) {
    location.text = address;
  }

  Future<void> createTraining() async {
    ViewUtil.showLoaderPage();
    final map = {
      "title": title.text,
      "description": description.text,
      "lat": "-6.792354",
      "lon": "107.679721",
      "max_enrollment": maxEnrollment.text,
      "enrollment_fee": enrollmentFees.text,
      "pre_requisitions[]": selectedPreRequisitionIds,
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
      url: "training-services/store",
      method: Method.POST,
      params: formData,
      callback: (response, success) {
        ViewUtil.hideLoader();
        //Navigation.pop();
        if (success && response != null) {
          final converted = CreateTrainingResponse.fromJson(response.data);
          ViewUtil.snackBar(
            "Training created successfully",
            context,
          );
          Navigation.push(
            appRoutes: AppRoutes.listTrainingSchedules,
            arguments: converted.data?.id,
          );
        }
      },
    );
  }

  Future<void> updateTraining() async {
    ViewUtil.showLoaderPage();
    final map = {
      "title": title.text,
      "description": description.text,
      "lat": "-6.792354",
      "lon": "107.679721",
      "max_enrollment": maxEnrollment.text,
      "enrollment_fee": enrollmentFees.text,
      "pre_requisitions[]": selectedPreRequisitionIds,
      // Files will be added separately
    };
    'here is: $map'.log();
    'featuredImage is: ${featuredImage?.path}'.log();

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
      url:
          "training-services/${widget.details?.data?.trainingService?.id}/update",
      method: Method.POST,
      params: formData,
      callback: (response, success) {
        ViewUtil.hideLoader();
        //Navigation.pop();
        if (success && response != null) {
          final converted = CreateTrainingResponse.fromJson(response.data);
          ViewUtil.snackBar(
            "Training updated successfully",
            context,
          );
          Navigation.push(
            appRoutes: AppRoutes.listTrainingSchedules,
            arguments: converted.data?.id,
          );
        }
      },
    );
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
        "service_type": 'training',
        'id': widget.details?.data?.trainingService?.id,
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

  Future<void> getPrerequisites() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "pre-requisitions/list",
      method: Method.GET,
      callback: (response, success) {
        Navigation.pop();
        if (success) {
          final converted =
              TrainingPreRequisitionsResponse.fromJson(response?.data);
          preRequisitions = converted.data ?? [];
          setState(() {});
        }
      },
    );
  }
}

class ListPrerequieites extends StatefulWidget {
  final List<PreRequisition> preRequisitions;
  final Function(List<PreRequisition> items) onSelect;

  const ListPrerequieites({
    super.key,
    required this.preRequisitions,
    required this.onSelect,
  });

  @override
  State<ListPrerequieites> createState() => _ListPrerequieitesState();
}

class _ListPrerequieitesState extends State<ListPrerequieites> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GlobalText(
                      str: "Training Pre-requisitions",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: KColor.black.color,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigation.pop(),
                    child: Icon(
                      Icons.close,
                      color: KColor.black.color,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.preRequisitions.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemBuilder: (context, index) {
                  final item = widget.preRequisitions[index];
                  return InkWell(
                    onTap: () {
                      item.isSelected = !item.isSelected;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: item.isSelected ? 0 : 5.w,
                            bottom: item.isSelected ? 0 : 10.h,
                            right: item.isSelected ? 2.w : 6.w,
                          ),
                          child: GlobalImageLoader(
                            imagePath: item.isSelected
                                ? KAssetName.selectedCheckBoxPng.imagePath
                                : KAssetName.unSelectedCheckboxPng.imagePath,
                            height: item.isSelected ? 30.h : 20.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 9.h),
                            child: GlobalText(
                              str: item.title ?? "",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: KColor.black.color,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              GlobalButton(
                onPressed: () {
                  final allSelected = widget.preRequisitions
                      .where((element) => element.isSelected)
                      .toList();
                  widget.onSelect(allSelected);
                  Navigation.pop();
                },
                buttonText: "Confirm",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomImage {
  final String path;
  final ImageFor imageFor;

  const CustomImage({
    required this.path,
    required this.imageFor,
  });
}
