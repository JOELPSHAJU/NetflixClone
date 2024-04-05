import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/application/models/popular/popular.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=dab291ee706b6e84664394469bd13e5b';

Future<List<Popular>> getAllPopular() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = PopularList.fromJson(_bodyAsJson['results']);
  print(_data.popularList[0].overview);
  return _data.popularList;
}