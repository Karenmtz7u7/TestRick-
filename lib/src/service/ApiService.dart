import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:test_rym_app/src/models/CharacterResponse.dart';

class ApiService with ChangeNotifier {
  List<Character> charactersList = [];

  ApiService() {
    getCharacters();
  }

  static Future<Map<String, dynamic>> getCharacters() async  {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
        
   if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load characters");
    }
  }
}
