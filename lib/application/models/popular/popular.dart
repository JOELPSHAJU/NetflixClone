class Popular {
 late int id;
 late String title;
 late String imagePath;
 late String overview;
  Popular(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.overview});

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
      id: json['id'],
      title: json['title'],
      imagePath: json['poster_path'],
      overview: json['overview'],
    );
  }
}

class PopularList {
  List<Popular> popularList;
  PopularList({required this.popularList});

  factory PopularList.fromJson(List<dynamic> json) {
    List<Popular> popular = [];
    popular = json.map((pop) => Popular.fromJson(pop)).toList();
    return PopularList(popularList: popular);
  }
}