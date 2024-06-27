// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/application/models/popular/popular.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=dab291ee706b6e84664394469bd13e5b';

Future<List<Popular>> getAllPopular() async {
  int count = 3;
  while (count >= 0) {
    final _response = await http.get(Uri.parse(getUrl));
    if (_response.statusCode == 200) {
      final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
      final _data = PopularList.fromJson(_bodyAsJson['results']);
      // ignore: avoid_print
      print(_data.popularList[0].overview);
      return _data.popularList;
    }
    count--;
  }
  return [];
}
