import 'dart:async';
import 'package:dio/dio.dart';
import '../models/food.dart';

class HttpClient {
  Future<List<Food>> fetchFoods() async {
    final client = Dio();
    final response = await client.get('https://dod-ps.herokuapp.com/alimentos');
    return response.data.map<Food>((json) => Food.fromJson(json)).toList();
  }
}
