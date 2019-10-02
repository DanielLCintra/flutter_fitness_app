import 'package:flutter/material.dart';
import '../models/food.dart';

class ListViewFoods extends StatelessWidget {
  final List<Food> foods;

  ListViewFoods({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: foods.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                '${foods[position].nome}',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              subtitle: Text(
                '${foods[position].calorias} calorias',
                style: new TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 25.0,
                    child: Text(
                      '${foods[position].idGrupo}',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              onTap: () => _onTapItem(context, foods[position]),
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Food food) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(food.idAlimento.toString() + ' - ' + food.nome)));
  }
}
