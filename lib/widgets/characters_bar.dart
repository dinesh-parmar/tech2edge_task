import 'package:flutter/material.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/utils/helpers.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

import '../utils/constants.dart';

class CharactersBar extends StatelessWidget {
  final Axis axis;
  final List<Character> characters;
  final double size;

  const CharactersBar({Key? key, required this.characters, required this.axis, required this.size}) : super(key: key);

  bool get isVertical => axis == Axis.vertical;

  @override
  Widget build(BuildContext context) {
    /*return ListView.separated(
      separatorBuilder: (ctx, i) => Padding(
        padding: EdgeInsets.symmetric(vertical: isVertical ? 0 : 10, horizontal: isVertical ? 10 : 0),
        child: isVertical ? const Divider(color: Colors.yellow) : const VerticalDivider(color: Colors.yellow),
      ),
      scrollDirection: axis,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 5),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () => showImageDialog(Url.getImageUrl(e.img!)),
          child: SizedBox(
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: PlatformCachedNetworkImage(
                    Url.getImageUrl(e.img!),
                    fit: BoxFit.cover,
                    width: 75,
                    height: 75,
                  ),
                ),
                const SizedBox(height: 5),
                Text(e.name! + "  "),
                Text(e.age!.toString() + " years old"),
                Text(e.profession!.toString()),
              ],
            ),
          ),
        );
      },
      itemCount: characters.length,
    );*/
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 8, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Characters:", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Expanded(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              direction: axis,
              children: characters.map(
                (e) {
                  return GestureDetector(
                    onTap: () => showImageDialog(Url.getImageUrl(e.img!), character: e, axis: axis),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: PlatformCachedNetworkImage(
                            Url.getImageUrl(e.img!),
                            fit: BoxFit.cover,
                            height: !isVertical ? size : null,
                            width: size,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Colors.black87, Colors.black12], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(e.name!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
