import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/utils/helpers.dart';
import 'package:tech2edge/widgets/characters_bar.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';
import 'package:tech2edge/widgets/rating_bar.dart';

import '../../utils/constants.dart';

class LandscapeMovieDetail extends StatelessWidget {
  final SeriesDetailResponse seriesDetail;

  const LandscapeMovieDetail({Key? key, required this.seriesDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(seriesDetail.series!.title!)),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          // enlargeCenterPage: false,
                          scrollDirection: Axis.vertical,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          height: constraints.maxHeight * 0.3,
                        ),
                        items: [
                          GestureDetector(
                            onTap: () => showImageDialog(Url.getImageUrl(seriesDetail.series!.img!)),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.purple)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: PlatformCachedNetworkImage(
                                  Url.getImageUrl(seriesDetail.series!.img!),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 8),
                      child: Text("Ratings:", style: TextStyle(fontSize: 18)),
                    ),
                    const RatingBar(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          seriesDetail.series!.title!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 25, height: 1.2),
                        ),
                      ),
                      Text(
                        seriesDetail.series!.desc!,
                        softWrap: true,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, bottom: 10, top: 10),
                      child: Text("Characters:", style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(child: CharactersBar(characters: seriesDetail.characters!, axis: Axis.vertical)),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
