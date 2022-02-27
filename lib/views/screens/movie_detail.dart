import 'package:flutter/material.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/views/landscape/movie_detail.dart';
import 'package:tech2edge/views/portrait/movie_detail.dart';

class MovieDetail extends StatelessWidget {
  final SeriesDetailResponse seriesDetail;

  const MovieDetail({Key? key, required this.seriesDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, orientation) =>
          orientation == Orientation.portrait ? PortraitMovieDetail(seriesDetail: seriesDetail) : LandscapeMovieDetail(seriesDetail: seriesDetail),
    );
  }
}
