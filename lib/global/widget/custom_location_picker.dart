// import 'package:flutter/material.dart';
// import 'package:osm_search_and_pick/open_street_map_search_and_pick.dart';
// import 'package:tixe_flutter_app/utils/extension.dart';
//
// class CustomLocationPicker extends StatelessWidget {
//   final Function(PickedData data) onPicked;
//
//   const CustomLocationPicker({
//     super.key,
//     required this.onPicked,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // return FlutterLocationPicker(
//     //   initZoom: 11,
//     //   minZoomLevel: 5,
//     //   maxZoomLevel: 16,
//     //   trackMyPosition: true,
//     //   onPicked: (pickedData) {},
//     // );
//     // return OpenMapPicker(
//     //   decoration: const InputDecoration(hintText: "Search"),
//     //   onChanged: (newValue) {
//     //     if (newValue != null) {
//     //       onPicked(newValue);
//     //     }
//     //   },
//     // );
//
//     return OpenStreetMapSearchAndPick(
//       //center: LatLong(23, 89),
//       buttonColor: Colors.blue,
//       buttonText: 'Set Current Location',
//       onPicked: (pickedData) {},
//     );
//   }
// }
