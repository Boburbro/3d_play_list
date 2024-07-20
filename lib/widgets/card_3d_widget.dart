import 'package:flutter/material.dart';

class Card3DWidget extends StatelessWidget {
  const Card3DWidget(
      {super.key, required this.imagePath, required this.withHero});

  final String imagePath;
  final bool withHero;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: withHero
            ? Hero(
                tag: imagePath,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              )
            : Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
