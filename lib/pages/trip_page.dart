import 'package:flutter/material.dart';
import 'package:trip_manager/widgets/city_visit_list_item_widget.dart';
import '../models/city_visit.dart';
import '../widgets/add_elemen_button.dart';
import '../widgets/empty_list_widget.dart';
import '../models/trip.dart';

class TripPage extends StatefulWidget {
  final Trip trip;
  const TripPage(this.trip, {super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.trip.name),
      ),
      body: Center(
        child: ListView(
          children: _getCitiVisitList(widget.trip.cities),
        ),
      ),
      floatingActionButton: AddElementButton(
        "Add City Visit",
        () {},
      ),
    );
  }

  List<Widget> _getCitiVisitList(List<CityVisit> citiesVisit) {
    if (citiesVisit.isEmpty) {
      return [
        const EmptyListWidget("No city visits yet!"),
      ];
    }
    citiesVisit.sort((visit1, visit2) =>
        visit1.arrivalTransport.time.compareTo(visit2.arrivalTransport.time));

    return citiesVisit
        .map((cityVisit) => CityVisitListItem(cityVisit, _deleteCityVisit))
        .toList();
  }

  void _deleteCityVisit(final CityVisit cityVisitToDelete) {
    setState(() {
      widget.trip.cities.remove(cityVisitToDelete);
    });
  }
}
