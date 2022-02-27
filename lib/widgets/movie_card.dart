import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech2edge/controller/movie_detail_controller.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/views/portrait/movie_detail.dart';
import 'package:tech2edge/views/screens/movie_detail.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

import '../utils/constants.dart';

class MovieCard extends StatelessWidget {
  final SeriesDetailResponse seriesDetailResponse;

  const MovieCard({Key? key, required this.seriesDetailResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => MovieDetail(seriesDetail: seriesDetailResponse)),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.only(left: 220),
            height: 150,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: const Color(0xff1B1C20),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  seriesDetailResponse.series!.title!,
                  style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Wrap(
                  children: ["Action ", "Crime ", "Drama "]
                      .map(
                        (e) => Text(
                          e,
                          style: const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 5),
                const Text(
                  "⭐ 8.6/10",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          ),
          Positioned(
            left: 30,
            top: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.purple),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: PlatformCachedNetworkImage(
                  Url.getImageUrl(seriesDetailResponse.series!.img!),
                  fit: BoxFit.contain,
                  width: 200,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
