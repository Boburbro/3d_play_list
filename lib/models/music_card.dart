class MusicCard {
  final String name;
  final String imagePath;

  MusicCard({
    required this.name,
    required this.imagePath,
  });
}

class MusicList {
  List<MusicCard> playList = [
    MusicCard(
      name: "1",
      imagePath:
          "https://i1.sndcdn.com/artworks-000110573944-18f1hu-t200x200.jpg",
    ),
    MusicCard(
      name: "2",
      imagePath:
          "https://i1.sndcdn.com/artworks-000089911335-1vphmp-t200x200.jpg",
    ),
    MusicCard(
      name: "3",
      imagePath:
          "https://i1.sndcdn.com/artworks-jVRR8DR7x8ryzRtF-woXZPw-t200x200.jpg",
    ),
    MusicCard(
      name: "4",
      imagePath: "https://i1.sndcdn.com/artworks-FuuNz3LBsQWW-0-t200x200.jpg",
    )
  ];
}
