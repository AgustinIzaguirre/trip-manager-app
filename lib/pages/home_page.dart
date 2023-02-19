import 'package:flutter/material.dart';
import 'package:trip_manager/widgets/trip_list_item_widget.dart';
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
    Trip.of("Europa2", []),
    Trip.of("Europa3", []),
    Trip.of("Europa4", []),
    Trip.of("Europa5", []),
    Trip.of("Europa6", []),
    Trip.of("Europa7", []),
    Trip.of("Europa8", []),
    Trip.of("Europa9", []),
    Trip.of("Europa10", []),
    Trip.of("Europa11", []),
    Trip.of("Europa12", []),
    Trip.of("Europa13", []),
    Trip.of("Europa14", []),
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
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: _trips.map((trip) => TripListItem(trip)).toList(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Text("Add trip", style: TextStyle(color: Colors.white)),
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
