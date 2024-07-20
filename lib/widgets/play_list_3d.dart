import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/music_card.dart';
import '../screens/details_screen.dart';
import 'card_item.dart';

class PlayList3d extends StatefulWidget {
  const PlayList3d({super.key});

  @override
  State<PlayList3d> createState() => _PlayList3dState();
}

class _PlayList3dState extends State<PlayList3d>
    with SingleTickerProviderStateMixin {
  List<MusicCard> playList = MusicList().playList;

  bool selectedMode = false;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.4,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            final selectionValue = _animationController.value;
            return GestureDetector(
              onTap: () => selectedMode
                  ? _animationController.reverse().whenComplete(
                        () => setState(() {
                          selectedMode = false;
                        }),
                      )
                  : _animationController.forward().whenComplete(
                        () => setState(() {
                          selectedMode = true;
                        }),
                      ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(selectionValue),
                child: AbsorbPointer(
                  absorbing: !selectedMode,
                  child: Container(
                    color: Colors.transparent,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth * 0.5,
                    child: Stack(
                      children: List.generate(
                        4,
                        (index) => CardItem(
                          height: constraints.maxHeight / 2,
                          card: playList[index],
                          percent: selectionValue,
                          depth: index,
                          onTap: () async {
                            _animationController
                                .reverse()
                                .whenComplete(() => setState(() {
                                      selectedMode = false;
                                    }));
                            Navigator.push(
                              ctx,
                              CupertinoPageRoute(
                                builder: (_) =>
                                    DetailsScreen(card: playList[index]),
                              ),
                            );
                          },
                        ),
                      ).reversed.toList(),
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
