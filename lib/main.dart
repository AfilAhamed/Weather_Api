import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weathercontroller.dart';
import 'package:weatherapp/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherApi',
        home: HomeScreen(),
      ),
    );
  }
}
