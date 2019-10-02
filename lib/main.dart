import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './BLoC/food_bloc.dart';

void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => FoodBloc()),
      ],
      child: MaterialApp(
        title: 'Fitness App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
