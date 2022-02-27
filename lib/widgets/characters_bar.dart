import 'package:flutter/material.dart';
import 'package:tech2edge/models/series_details_response.dart';
import 'package:tech2edge/utils/helpers.dart';
import 'package:tech2edge/widgets/platform_cached_network_image.dart';

import '../utils/constants.dart';

class CharactersBar extends StatelessWidget {
  final Axis axis;
  final List<Character> characters;

  const CharactersBar({Key? key, required this.characters, required this.axis}) : super(key: key);

  bool get isVertical => axis == Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, i) => Padding(
        padding: EdgeInsets.symmetric(vertical: isVertical ? 0 : 10, horizontal: isVertical ? 10 : 0),
        child: isVertical ? const Divider(color: Colors.yellow) : const VerticalDivider(color: Colors.yellow),
      ),
      scrollDirection: axis,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 5),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () => showImageDialog(Url.getImageUrl(characters[index].img!)),
          child: SizedBox(
            width: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: PlatformCachedNetworkImage(
                    Url.getImageUrl(characters[index].img!),
                    fit: BoxFit.cover,
                    width: 75,
                    height: 75,
                  ),
                ),
                const SizedBox(height: 5),
                Text(characters[index].name! + "  "),
                Text(characters[index].age!.toString() + " years old"),
                Text(characters[index].profession!.toString()),
              ],
            ),
          ),
        );
      },
      itemCount: characters.length,
    );
  }
}
