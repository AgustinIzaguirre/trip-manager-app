import 'package:flutter/material.dart';
import '../models/trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Trip> _trips = [
    Trip.of("Europa", []),
  ];

  void _addTrip(Trip newTrip) {
    setState(() {
      _trips.add(newTrip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Row(
                children: [Text(_trips[0].name)],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Text("Add trip"),
                const Icon(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
