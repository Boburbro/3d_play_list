import 'package:flutter/material.dart';
import '../models/music_card.dart';
import '../widgets/card_3d_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({required this.card, super.key});

  final MusicCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              "${card.name}.mp3",
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card3DWidget(
              imagePath: card.imagePath,
              withHero: true,
            ),
          ),
        ],
      ),
    );
  }
}
