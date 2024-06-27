import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix/application/models/upcoming/upcoming.dart';

const url =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=dab291ee706b6e84664394469bd13e5b';
Future<List<Upcoming>> getAllUpcoming() async {
  int count = 3;
  while (count >= 0) {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final bodyAsResponse = jsonDecode(response.body) as Map;
      final result = UpcomingList.fromJson(bodyAsResponse['results']);
      // ignore: avoid_print
      print(result.upcomingList[0].imagePath);
      return result.upcomingList;
    }
    count--;
  }
  return [];
}
