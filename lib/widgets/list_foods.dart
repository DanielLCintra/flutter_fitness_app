import 'package:flutter/material.dart';
import '../models/food.dart';

class ListViewFoods extends StatelessWidget {
  final List<Food> foods;
  final List<Food> availableFoods;

  ListViewFoods({Key key, this.foods, this.availableFoods}) : super(key: key);

  static groupColor(group) {
    switch (group) {
      case 1:
        return Colors.blue;
        break;
      case 2:
        return Colors.red;
        break;
      case 3:
        return Colors.amber;
        break;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: availableFoods != null ? availableFoods.length : foods.length,
      padding: const EdgeInsets.all(15.0),
      itemBuilder: (context, position) {
        return ListTile(
          title: Text(
            '${availableFoods != null ? availableFoods[position].nome : foods[position].nome}',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.deepOrangeAccent,
            ),
          ),
          subtitle: Text(
            '${availableFoods != null ? availableFoods[position].grupo.nome : foods[position].grupo.nome}',
            style: new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: availableFoods != null
                    ? groupColor(availableFoods[position].idGrupo)
                    : groupColor(foods[position].idGrupo),
                radius: 25.0,
                child: Text(
                  '${availableFoods != null ? availableFoods[position].calorias : foods[position].calorias}',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
