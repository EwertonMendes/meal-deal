import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meal_deal/helpers/flag_helper.dart' as flag_helper;
import 'package:meal_deal/models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Meal Deal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Meal> meal;

  void _nextMeal() {
    setState(() {
      meal = getMeal();
    });
  }

  Future<Meal> getMeal() async {
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body)['meals'] as List;
      return Meal.fromJson(result[0]);
    }

    throw Exception('Failed to load meal');
  }

  @override
  void initState() {
    super.initState();
    meal = getMeal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            elevation: 3,
            child: SizedBox(
              width: 320,
              height: 500,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder<Meal>(
                      future: meal,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Center(child: Text(snapshot.data!.name)),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(snapshot.data!.picture),
                                ),
                              ),
                              Text(snapshot.data!.nationality),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                    'https://countryflagsapi.com/png/${flag_helper.getFlagForNationality(snapshot.data!.nationality)}'),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextMeal,
        tooltip: 'Next Meal',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
