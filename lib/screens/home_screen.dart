import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/widgets/header.dart';
import '../models/food.dart';
import '../widgets/list_foods.dart';
// import '../widgets/header.dart';
import '../BLoC/food_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> originalFoods;
  final FoodBloc bloc = BlocProvider.getBloc<FoodBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Column(
        children: <Widget>[
          Header(),
          Expanded(
            child: Container(
              child: Consumer<FoodBloc>(
                builder: (BuildContext context, FoodBloc foodBloc) {
                  bloc.fetchFoods();
                  return foodBloc.foods != null
                      ? ListViewFoods(
                          foods: foodBloc.foods,
                          availableFoods: foodBloc.availableFoods,
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
