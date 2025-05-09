// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
// import 'package:tixe_flutter_app/modules/arm_store/views/components/featured_arm_item.dart';
// import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
// import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
//
// class FeaturedArms extends ConsumerWidget {
//   const FeaturedArms({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(armStoreController);
//     final controller = ref.read(armStoreController.notifier);
//     return Column(
//       children: [
//         SizedBox(
//           height: 340.h,
//           child: PageView.builder(
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return FeaturedArmItem(
//                 id: 0,
//                 title: "AR 775B8 - AR Rifle",
//                 amount: "275",
//                 shortDescription:
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus mi non egestas",
//                 image: KAssetName.dummyGearPng.imagePath,
//               );
//             },
//             onPageChanged: controller.setPageIndex,
//           ),
//         ),
//         SizedBox(
//           height: 20.w,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(5, (index) {
//             final isSelected = state.pageIndex == index;
//             return Container(
//               height: 10.h,
//               width: 10.w,
//               margin: EdgeInsets.symmetric(horizontal: 5.w),
//               decoration: BoxDecoration(
//                 color: isSelected ? KColor.btnGradient1.color : null,
//                 border: Border.all(
//                   color: isSelected
//                       ? KColor.btnGradient1.color
//                       : KColor.grey.color,
//                 ),
//                 shape: BoxShape.circle,
//               ),
//             );
//           }),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/arms_store_slide_model.dart';
import 'package:tixe_flutter_app/modules/arm_store/repository/arms_store_slide_repository.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/featured_arm_item.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FeaturedArms extends StatefulWidget {
  const FeaturedArms({super.key});

  @override
  _FeaturedArmsState createState() => _FeaturedArmsState();
}

class _FeaturedArmsState extends State<FeaturedArms> {
  final AppStoreSlideRepository _repository = AppStoreSlideRepository();
  ArmStoreSlideModel? _slideModel;
  int _pageIndex = 0;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchSlides();
  }

  Future<void> _fetchSlides() async {
    try {
      final slideModel = await _repository.getSlides();
      setState(() {
        _slideModel = slideModel;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _setPageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    }

    final slides = _slideModel?.data ?? [];

    return Column(
      children: [
        SizedBox(
          height: 340.h,
          child: PageView.builder(
            itemCount: slides.isNotEmpty ? slides.length : 1, // Fallback to 1 if empty
            itemBuilder: (context, index) {
              if (slides.isEmpty) {
                return FeaturedArmItem(
                  id: 0,
                  title: "No Slides Available",
                  amount: "0",
                  shortDescription: "No data available",
                  image: KAssetName.dummyGearPng.imagePath,
                );
              }
              final slide = slides[index];
              return FeaturedArmItem(
                id: slide.id ?? 0,
                title: slide.title ?? "AR Rifle",
                amount: slide.price?.toString() ?? "0",
                shortDescription: slide.description ?? "No description",
                image: slide.featureImage ?? KAssetName.dummyGearPng.imagePath,
              );
            },
            onPageChanged: _setPageIndex,
          ),
        ),
        SizedBox(height: 20.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            slides.isNotEmpty ? slides.length : 1, // Fallback to 1 if empty
                (index) {
              final isSelected = _pageIndex == index;
              return Container(
                height: 10.h,
                width: 10.w,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: isSelected ? KColor.btnGradient1.color : null,
                  border: Border.all(
                    color: isSelected
                        ? KColor.btnGradient1.color
                        : KColor.grey.color,
                  ),
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}