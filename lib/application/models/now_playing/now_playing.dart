class NowPlaying {
  late int id;
  late String title;
  late String imagePath;
  late String overview;
  NowPlaying(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.overview});

  factory NowPlaying.fromJson(Map<String, dynamic> json) {
    return NowPlaying(
      id: json['id'],
      title: json['title'],
      imagePath: json['poster_path'],
      overview: json['overview'],
    );
  }
}

class NowplayingList {
  List<NowPlaying> nowplayingList;
  NowplayingList({required this.nowplayingList});

  factory NowplayingList.fromJson(List<dynamic> json) {
    List<NowPlaying> nowplaying = [];
    nowplaying = json.map((pop) => NowPlaying.fromJson(pop)).toList();
    return NowplayingList(nowplayingList: nowplaying);
  }
}
