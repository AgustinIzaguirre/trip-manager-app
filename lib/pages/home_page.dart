import 'package:flutter/material.dart';
import 'package:trip_manager/models/means_of_transport.dart';
import 'package:trip_manager/models/transport_type.dart';
import '../models/city_visit.dart';
import '../widgets/empty_list_widget.dart';
import '../widgets/trip_list_item_widget.dart';
import '../models/trip.dart';
import '../widgets/add_elemen_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Trip> _trips = [
    Trip.of("Europa", [
      CityVisit.of(
          MeansOfTransport.of(
            DateTime.now(),
            "Buenos Aires",
            "Madrid",
            TransportType.plane,
          ),
          MeansOfTransport.of(
            DateTime.now(),
            "Madrid",
            "Roma",
            TransportType.plane,
          ),
          "Madrid",
          "Spain",
          [])
    ]),
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
          children: _getTripList(_trips),
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add Trip",
        () {},
      ),
    );
  }

  List<Widget> _getTripList(List<Trip> trips) {
    if (trips.isEmpty) {
      return [
        const EmptyListWidget("No trips yet!"),
      ];
    }
    return trips.map((trip) => TripListItem(trip)).toList();
  }
}
