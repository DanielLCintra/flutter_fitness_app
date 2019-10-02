import 'package:flutter/material.dart';
import '../models/food.dart';

class ListViewFoods extends StatefulWidget {
  final List<Food> foods;

  ListViewFoods({Key key, this.foods}) : super(key: key);

  @override
  _ListViewFoodsState createState() => _ListViewFoodsState();
}

class _ListViewFoodsState extends State<ListViewFoods> {
  List<Food> _availableFoods = [];
  final caloriesCtrl = TextEditingController();

  void filterFoods() {
    setState(() {
      _availableFoods = [];
    });

    final double caloriesTotal = double.parse(caloriesCtrl.text);

    final List<Food> group1 =
        widget.foods.where((food) => food.idGrupo == 1).toList();
    final List<Food> group2 =
        widget.foods.where((food) => food.idGrupo == 2).toList();
    final List<Food> group3 =
        widget.foods.where((food) => food.idGrupo == 3).toList();

    for (var i = 0; i < group1.length; i++) {
      for (var y = 0; y < group2.length; y++) {
        for (var k = 0; k < group3.length; k++) {
          if (group1[i].calorias + group2[y].calorias + group3[k].calorias ==
              caloriesTotal) {
            setState(() {
              _availableFoods.add(group1[i]);
              _availableFoods.add(group2[y]);
              _availableFoods.add(group3[k]);
            });
          }
        }
      }
    }
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                  size: 50,
                ),
                title: Text(
                  'Insira a quantidade de calorias total para saber as possiveis combinações de alimentos',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey, Colors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(20),
        //   child: Center(
        //     child: Text(
        //       'Insira a quantidade de calorias total para saber as possiveis combinações de alimentos',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Container(
                width: 290,
                child: TextField(
                  controller: caloriesCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Calorias',
                  ),
                  onSubmitted: null,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 80,
                height: 75,
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.pink,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: filterFoods,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Alimentos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
                itemCount: _availableFoods.length > 0
                    ? _availableFoods.length
                    : widget.foods.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, position) {
                  return ListTile(
                    title: Text(
                      '${_availableFoods.length > 0 ? _availableFoods[position].nome : widget.foods[position].nome}',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    subtitle: Text(
                      '${_availableFoods.length > 0 ? _availableFoods[position].grupo.nome : widget.foods[position].grupo.nome}',
                      style: new TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    leading: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: _availableFoods.length > 0 ? groupColor(_availableFoods[position].idGrupo) : groupColor(widget.foods[position].idGrupo),
                          radius: 25.0,
                          child: Text(
                            '${_availableFoods.length > 0 ? _availableFoods[position].calorias : widget.foods[position].calorias}',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
