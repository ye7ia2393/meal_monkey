import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtil {
  static Future<BitmapDescriptor> imageFromAsset(
      {required String imageName}) async {
    return imageName.isNotEmpty
        ? await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(),
            "assets/images/$imageName",
          )
        : BitmapDescriptor.defaultMarker;
  }

  static Future<BitmapDescriptor> imageFromUrl(
      {required String imageUrl}) async {
    if (imageUrl.isNotEmpty) {
      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
              .buffer
              .asUint8List();

      return BitmapDescriptor.fromBytes(bytes);
    } else
      return BitmapDescriptor.defaultMarker;
  }

  static Future<BitmapDescriptor> getImageFromNetwork(
      {required String imageUrl}) async {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
            .buffer
            .asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  static Future<BitmapDescriptor> getImageFromAsset(
      {required String imageName}) async {
    return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/$imageName",
    );
  }
}
