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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _trips.map((trip) => TripListItem(trip)).toList(),
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
