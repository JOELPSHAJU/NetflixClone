class TopRated {
  late int id;
  late String title;
  late String overview;
  late String releaseDate;
  late String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w355_and_h200_multi_faces';

  TopRated(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory TopRated.fromJson(Map<String, dynamic> json) {
    return TopRated(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class TopRatedList {
  List<TopRated> topRatedList;
  TopRatedList({required this.topRatedList});

  factory TopRatedList.fromJson(List<dynamic> json) {
    List<TopRated> topRated = [];
    topRated = json.map((top) => TopRated.fromJson(top)).toList();
    return TopRatedList(topRatedList: topRated);
  }
}
