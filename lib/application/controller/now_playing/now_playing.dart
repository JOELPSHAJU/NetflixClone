// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:netflix/application/models/now_playing/now_playing.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=dab291ee706b6e84664394469bd13e5b';

Future<List<NowPlaying>> getAllNowPlaying() async {
  int count = 3;
  while (count >= 0) {
    final _response = await http.get(Uri.parse(getUrl));
    if (_response.statusCode == 200) {
      final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
      final _data = NowplayingList.fromJson(_bodyAsJson['results']);
      print(_data.nowplayingList[0].overview);
      return _data.nowplayingList;
    }
    count--;
  }
  return [];
}
