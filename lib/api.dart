import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:return_flutter/game.dart';

class ApiHelper {

  String url = 'http://localhost:3000';

  Future<Game> fetchGame(int gameId) async {
    final response = await http.get(url + '/scores/' +  gameId.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Game.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load game');
    }
  }



}