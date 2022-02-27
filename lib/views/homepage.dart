import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech2edge/controller/movie_detail_controller.dart';
import 'package:tech2edge/widgets/movie_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final seriesDetailController = Get.put(MovieDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tech2Edge"), backgroundColor: Colors.deepOrangeAccent),
      body: SafeArea(
        child: Obx(() {
          if (seriesDetailController.isLoading.isTrue) return const Center(child: CircularProgressIndicator(color: Colors.deepOrangeAccent));
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, _) => MovieCard(seriesDetailResponse: seriesDetailController.seriesDetail.value),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        items: const [
          BottomNavigationBarItem(label: "Trending", icon: Icon(Icons.trending_up)),
          BottomNavigationBarItem(label: "Upcoming", icon: Icon(Icons.upcoming)),
          BottomNavigationBarItem(label: "Top-rated", icon: Icon(Icons.star_border)),
        ],
      ),
    );
  }
}
