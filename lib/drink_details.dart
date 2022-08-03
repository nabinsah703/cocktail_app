import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  // const DrinkDetails({Key? key}) : super(key: key);
  final drink;

  const DrinkDetails({super.key, @required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("${drink["strDrink"]}"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: Center(
                  child: CircleAvatar(
                    radius: 150.0,
                    backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                  ),
                ),
              ),
              Text(
                "ID: ${drink["idDrink"]}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${drink["strDrink"]}",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
