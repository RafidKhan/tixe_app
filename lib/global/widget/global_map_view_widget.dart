import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

class GlobalMapViewWidget extends StatelessWidget {
  final double lat;
  final double lon;

  const GlobalMapViewWidget({
    super.key,
    required this.lat,
    required this.lon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        height: 213.h,
        width: context.width,
        // child: OSMFlutter(
        //   controller: MapController(
        //     // initMapWithUserPosition: const UserTrackingOption.withoutUserPosition(
        //     //   enableTracking: false,
        //     // ),
        //     useExternalTracking: true,
        //     initPosition: GeoPoint(
        //       latitude: lat,
        //       longitude: lon,
        //     ), // Eiffel Tower location
        //   ),
        //   osmOption: const OSMOption(),
        //   mapIsLoading: const GlobalCircularLoader(),
        // ),
        child: OSMViewer(
          controller: SimpleMapController(
            initPosition: GeoPoint(
              latitude: lat,
              longitude: lon,
            ),
            markerHome: const MarkerIcon(
              icon: Icon(Icons.navigation_outlined),
            ),
          ),
          zoomOption: const ZoomOption(
            initZoom: 16,
            minZoomLevel: 11,
          ),
        ),
      ),
    );
  }
}
