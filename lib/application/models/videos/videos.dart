class Videos {
  String id;
  String title;
  String videoUrl;
  Videos({required this.id, required this.title, required this.videoUrl});

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
        id: json['id'], title: json['title'], videoUrl: json['videoUrl']);
  }
}

class VideosList {
  List<Videos> videos;
  VideosList({required this.videos});

  factory VideosList.fromJson(List<dynamic> json) {
    List<Videos> videos = [];
    videos = json.map((video) => Videos.fromJson(video)).toList();
    return VideosList(videos: videos);
  }
}