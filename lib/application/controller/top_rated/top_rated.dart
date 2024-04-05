import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/application/models/top_rated/top_rated.dart';
import 'package:netflix/infrastructure/api_key.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=dab291ee706b6e84664394469bd13e5b';

Future<List<TopRated>> getTopRatedMovies() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = TopRatedList.fromJson(_bodyAsJson['results']);

  return _data.topRatedList;
}
