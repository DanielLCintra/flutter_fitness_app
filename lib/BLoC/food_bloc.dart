import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_fitness_app/models/food.dart';
import 'package:flutter_fitness_app/services/http_client.dart';

class FoodBloc extends BlocBase {
  List<Food> foods;
  List<Food> availableFoods;

  void fetchFoods() async {
    var _client = HttpClient();
    final results = await _client.fetchFoods();
    foods = results;
    notifyListeners();
  }

  void filterFoods(calories) {
    availableFoods = [];
    notifyListeners();

    final double caloriesTotal = double.parse(calories);

    final List<Food> group1 = foods.where((food) => food.idGrupo == 1).toList();
    final List<Food> group2 = foods.where((food) => food.idGrupo == 2).toList();
    final List<Food> group3 = foods.where((food) => food.idGrupo == 3).toList();

    for (var i = 0; i < group1.length; i++) {
      for (var y = 0; y < group2.length; y++) {
        for (var k = 0; k < group3.length; k++) {
          if (group1[i].calorias + group2[y].calorias + group3[k].calorias ==
              caloriesTotal) {
            availableFoods.add(group1[i]);
            availableFoods.add(group2[y]);
            availableFoods.add(group3[k]);
          }
        }
      }
    }
    notifyListeners();
  }
}
