import 'package:flutter/material.dart';
import '../models/food.dart';
import '../widgets/list_foods.dart';
import '../services/http_client.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fitness App'),
        ),
        body: FutureBuilder<List<Food>>(
          future: HttpClient().fetchFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            print(snapshot);
            return snapshot.hasData
                ? ListViewFoods(foods: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
