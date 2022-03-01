import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

import '../models/series_details_response.dart';

void showImageDialog(String imageUrl, {Character? character, Axis axis = Axis.vertical}) => Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.black12,
        content: Wrap(
          direction: axis,
          spacing: 10,
          runSpacing: 10,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PlatformCachedNetworkImage(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            if (character != null)
              Text(
                "Name: ${character.name}. \nAge: ${character.age} years old. \nProfession: ${character.profession}.",
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.start,
              ),
          ],
        ),
      ),
      barrierColor: Colors.black87,
      barrierDismissible: true,
    );
