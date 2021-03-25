import 'dart:convert' as convert;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class JokeService {
  Future<Map<String, dynamic>?> getRandomDadJoke() async {
    final uri = Uri.parse('https://icanhazdadjoke.com/');
    try {
      final response =
          await http.get(uri, headers: {'Accept': 'application/json'});
      if (response.statusCode == 200) {
        return convert.json.decode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}

final jokeServiceProvider = Provider((_) => JokeService());
