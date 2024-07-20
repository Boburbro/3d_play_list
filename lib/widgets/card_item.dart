import 'package:flutter/material.dart';
import '../models/music_card.dart';
import 'card_3d_widget.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.height,
    required this.card,
    required this.percent,
    required this.depth,
    required this.onTap,
  });

  final double height;
  final MusicCard card;
  final double percent;
  final int depth;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: height + -depth * height / 2.0 * percent - height / 5.0,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(0.0, 0.0, depth * 60),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            height: height,
            child: Card3DWidget(
              imagePath: card.imagePath,
              withHero: true,
            ),
          ),
        ),
      ),
    );
  }
}
