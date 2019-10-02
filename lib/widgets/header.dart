import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_fitness_app/BLoC/food_bloc.dart';
import '../BLoC/food_bloc.dart';

class Header extends StatefulWidget {
  final Function filterHandler;

  Header({this.filterHandler});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final FoodBloc bloc = BlocProvider.getBloc<FoodBloc>();
  final caloriesCtrl = TextEditingController();

  Widget infoMessage() {
    return Container(
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
    );
  }

  Widget formCaloriesSearch() {
    return Container(
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
              onPressed: () => bloc.filterFoods(caloriesCtrl.text),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          infoMessage(),
          formCaloriesSearch(),
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
        ],
      ),
    );
  }
}
