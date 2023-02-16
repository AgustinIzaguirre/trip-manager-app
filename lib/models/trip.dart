import './city_visit.dart';

class Trip {
  final String name;
  final List<CityVisit> cities;

  Trip._(this.name, this.cities);

  static Trip of(final String name, final List<CityVisit> cities) {
    return Trip._(name, cities);
  }
}
