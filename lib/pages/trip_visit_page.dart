import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripPage extends StatelessWidget {
  final Trip trip;
  const TripPage(this.trip, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip page"),
      ),
      body: Center(
        child: Text(trip.name),
      ),
    );
  }
}
