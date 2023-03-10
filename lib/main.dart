import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main() {
  runApp(const TripManager());
}

class TripManager extends StatelessWidget {
  const TripManager({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Trips'),
      debugShowCheckedModeBanner: false,
    );
  }
}
