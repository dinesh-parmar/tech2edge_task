import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

void showImageDialog(String imageUrl) => Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: PlatformCachedNetworkImage(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      barrierColor: Colors.black87,
      barrierDismissible: true,
    );
