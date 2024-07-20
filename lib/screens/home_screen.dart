import 'package:flutter/material.dart';
import '../models/music_card.dart';
import '../widgets/card_3d_widget.dart';
import '../widgets/play_list_3d.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<MusicCard> playList = MusicList().playList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: const Text("My play list"),
        centerTitle: true,
        actions: const [
          Icon(Icons.search_rounded),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 3,
            child: PlayList3d(),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: playList.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card3DWidget(
                  imagePath: playList[index].imagePath,
                  withHero: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
