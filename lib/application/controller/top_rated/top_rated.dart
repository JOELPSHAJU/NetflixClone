import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/application/models/top_rated/top_rated.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=dab291ee706b6e84664394469bd13e5b';

Future<List<TopRated>> getTopRatedMovies() async {
  int count = 3;
  while (count >= 0) {
    final response = await http.get(Uri.parse(getUrl));
    if (response.statusCode == 200) {
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final data = TopRatedList.fromJson(bodyAsJson['results']);

      return data.topRatedList;
    }
    count--;
  }
  return [];
}
