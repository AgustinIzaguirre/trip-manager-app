class CityVisit {
  final DateTime arrivalDate;
  final DateTime departureDate;
  final String name;
  final String country;
  final List<String> todos;

  CityVisit._(
    this.arrivalDate,
    this.departureDate,
    this.name,
    this.country,
    this.todos,
  );

  static CityVisit of(
    final DateTime arrivalDate,
    final DateTime departureDate,
    final String name,
    final String country,
    List<String> todos,
  ) {
    return CityVisit._(arrivalDate, departureDate, name, country, todos);
  }

  int get daysOfVisit {
    return (departureDate.difference(arrivalDate).inHours / 24).round();
  }
}
