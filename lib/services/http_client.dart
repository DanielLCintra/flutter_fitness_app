import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/food.dart';

class HttpClient {
  Future<List<Food>> fetchFoods() async {
    final client = http.Client();
    final response = await client.get('https://dod-ps.herokuapp.com/alimentos');
    return parseFoods(response.body);
  }

  List<Food> parseFoods(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Food>((json) => Food.fromJson(json)).toList();
  }
}
