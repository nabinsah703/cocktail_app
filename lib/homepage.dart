import 'package:cocktail/drink_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:cocktail/drink_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail");
  var response, drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    response = await http.get(api);

    drinks = convert.jsonDecode(response.body)["drinks"];

    setState(() {});
  }
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 8.0,
          title: const Center(
            child: Text(
              'Cocktail App',
              textScaleFactor: 3.0,
            ),
          ),
        ),
        body: Center(
            child: response != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(drink["strDrinkThumb"]),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${drink["strDrink"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetails(drink: drink)));
                        }),
                      );
                    })
                : const CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  )),
      ),
    );
  }
}
