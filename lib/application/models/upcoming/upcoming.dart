class Upcoming {
  late int id;
  late String title;
  late String imagePath;
  late String overview;
  Upcoming(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.overview});

  factory Upcoming.fromJson(Map<String, dynamic> json) {
    return Upcoming(
      id: json['id'],
      title: json['title'],
      imagePath: json['poster_path'],
      overview: json['overview'],
    );
  }
}

class UpcomingList {
  List<Upcoming> upcomingList;
  UpcomingList({required this.upcomingList});

  factory UpcomingList.fromJson(List<dynamic> json) {
    List<Upcoming> popular = [];
    popular = json.map((pop) => Upcoming.fromJson(pop)).toList();
    return UpcomingList(upcomingList: popular);
  }
}
