import 'package:trip_manager/models/todo.dart';

import './means_of_transport.dart';
import '../constants/country.dart';

class CityVisit {
  final MeansOfTransport arrivalTransport;
  final MeansOfTransport departureTransport;
  final String name;
  final Country country;
  final List<Todo> todos;

  CityVisit._(
    this.arrivalTransport,
    this.departureTransport,
    this.name,
    this.country,
    this.todos,
  );

  static CityVisit of(
    final MeansOfTransport arrivalTransport,
    final MeansOfTransport departureTransport,
    final String name,
    final Country country,
    List<Todo> todos,
  ) {
    return CityVisit._(
        arrivalTransport, departureTransport, name, country, todos);
  }

  int get daysOfVisit {
    return (departureTransport.time.difference(arrivalTransport.time).inHours /
            24)
        .round();
  }

  bool equals(final CityVisit other) {
    return name == other.name &&
        arrivalTransport.time == other.arrivalTransport.time &&
        departureTransport.time == other.departureTransport.time;
  }
}
