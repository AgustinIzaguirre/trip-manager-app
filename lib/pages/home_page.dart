import 'package:flutter/material.dart';
import 'package:trip_manager/models/means_of_transport.dart';
import 'package:trip_manager/models/todo.dart';
import 'package:trip_manager/models/transport_type.dart';
import '../models/city_visit.dart';
import '../widgets/empty_list_widget.dart';
import '../widgets/trip_list_item_widget.dart';
import '../models/trip.dart';
import '../widgets/add_elemen_button.dart';
import '../constants/country.dart';

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
            DateTime(2023, 4, 28, 14, 15),
            "Buenos Aires",
            "Madrid",
            TransportType.plane,
          ),
          MeansOfTransport.of(
            DateTime(2023, 4, 29, 17, 5),
            "Madrid",
            "Roma",
            TransportType.plane,
          ),
          "Madrid",
          Country.spain,
          [Todo.of("test done", true), Todo.of("test not done", false)]),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 4, 29, 19, 35),
            "Madrid",
            "Roma",
            TransportType.plane,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 2, 15, 10),
            "Roma",
            "Florencia",
            TransportType.train,
          ),
          "Roma",
          Country.italy,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 2, 16, 46),
            "Roma",
            "Florencia",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 4, 6, 20),
            "Florencia",
            "Zermatt",
            TransportType.train,
          ),
          "Florencia",
          Country.italy,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 4, 14, 51),
            "Florencia",
            "Zermatt",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 6, 5, 37),
            "Zermatt",
            "Paris",
            TransportType.train,
          ),
          "Zermatt",
          Country.switzerland,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 6, 12, 38),
            "Zermatt",
            "Paris",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 9, 10, 25),
            "Paris",
            "Amsterdam",
            TransportType.train,
          ),
          "Paris",
          Country.france,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 9, 13, 44),
            "Paris",
            "Amsterdam",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 12, 7, 47),
            "Amsterdam",
            "Londres",
            TransportType.train,
          ),
          "Amsterdam",
          Country.netherlands,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 12, 10, 43),
            "Amsterdam",
            "Londres",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 15, 8, 30),
            "Londres",
            "Edimburgo",
            TransportType.train,
          ),
          "Londres",
          Country.england,
          []),
      CityVisit.of(
          MeansOfTransport.of(
            DateTime(2023, 5, 15, 13, 12),
            "Londres",
            "Edinburgo",
            TransportType.train,
          ),
          MeansOfTransport.of(
            DateTime(2023, 5, 17, 7, 25),
            "Edimburgo",
            "Barcelona",
            TransportType.plane,
          ),
          "Edimburgo",
          Country.scotland,
          []),
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
