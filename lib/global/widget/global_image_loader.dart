import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader({
    super.key,
    required this.imagePath,
    this.imageFor = ImageFor.asset,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder,
    this.color,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final ImageFor imageFor;
  final String? placeHolder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final String defaultPlaceHolder = placeHolder ?? KAssetName.errorPng.imagePath;
    if (imageFor == ImageFor.network) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        height: height,
        width: width,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.asset(
          defaultPlaceHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (imageFor == ImageFor.file) {
      return Image.file(
        File(imagePath),
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, exception, stackTrace) => Image.asset(
          defaultPlaceHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else {
      return Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, exception, stackTrace) => Image.asset(
          defaultPlaceHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
  }
}
