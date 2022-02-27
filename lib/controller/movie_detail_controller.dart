import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tech2edge/models/series_details_response.dart';

import '../utils/constants.dart';

class MovieDetailController extends GetxController {
  final seriesDetail = SeriesDetailResponse().obs;
  final isLoading = false.obs;
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    dio.interceptors.add(LogInterceptor(responseBody: true, request: true));
    getMovieDetails();
  }

  Future<void> getMovieDetails() async {
    isLoading.value = true;
    final response = await dio.get(Url.baseUrl + "/data-sg");
    if (response.statusCode == 200 && response.data != null) {
      seriesDetail.value = SeriesDetailResponse.fromJson(response.data);
      isLoading.value = false;
    }
  }
}
