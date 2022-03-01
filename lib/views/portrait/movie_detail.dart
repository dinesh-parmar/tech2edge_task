import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/utils/helpers.dart';
import 'package:tech2edge/widgets/characters_bar.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

import '../../utils/constants.dart';
import '../../widgets/rating_bar.dart';

class PortraitMovieDetail extends StatelessWidget {
  final SeriesDetailResponse seriesDetail;

  const PortraitMovieDetail({Key? key, required this.seriesDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(seriesDetail.series!.title!)),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    height: constraints.maxHeight * 0.2,
                    autoPlay: true,
                  ),
                  items: [
                    GestureDetector(
                      onTap: () => showImageDialog(Url.getImageUrl(seriesDetail.series!.img!), axis: Axis.horizontal),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.purple)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: PlatformCachedNetworkImage(
                            Url.getImageUrl(seriesDetail.series!.img!),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 8, bottom: 8),
                  child: Text("Ratings:", style: TextStyle(fontSize: 18)),
                ),
                const RatingBar(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    seriesDetail.series!.title! + " :",
                    style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 25, height: 1.2),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(seriesDetail.series!.desc!, style: const TextStyle(fontSize: 12)),
                  ),
                ),
                Expanded(
                  child: CharactersBar(
                    characters: seriesDetail.characters!,
                    axis: Axis.horizontal,
                    size: constraints.maxHeight * 0.13,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
