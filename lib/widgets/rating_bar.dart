import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 8.6 / 10),
            duration: const Duration(seconds: 1),
            builder: (ctx, value, _) {
              Color color = Colors.yellow;
              if (value > 0 && value < 0.2) {
                color = const Color(0xffB92815);
              } else if (value > 0.2 && value <= 0.4) {
                color = const Color(0xffE8311B);
              } else if (value > 0.4 && value <= 0.6) {
                color = const Color(0xffFEA200);
              } else if (value > 0.6 && value <= 0.8) {
                color = const Color(0xffFFEE0C);
              } else if (value > 0.8 && value <= 1) {
                color = const Color(0xff78DC16);
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: value,
                  color: color,
                  minHeight: 20,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 8.6 / 10),
              duration: const Duration(seconds: 1),
              builder: (ctx, value, _) {
                return Text(
                  "${(value * 10).toStringAsPrecision(2)}/10",
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
                );
              }),
        ],
      ),
    );
  }
}
