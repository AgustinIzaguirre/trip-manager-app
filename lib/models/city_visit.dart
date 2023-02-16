class CityVisit {
  final String arrivalDate;
  final String departureDate;
  final String name;
  final String country;
  final List<String> todos;
  int daysOfStay;

  CityVisit._(
    this.arrivalDate,
    this.departureDate,
    this.name,
    this.country,
    this.todos,
  ) {
    daysOfStay = 1; //TODO calculate from arrival and departure date
  }

  static CityVisit of(
    final String arrivalDate,
    final String departureDate,
    final String name,
    final String country,
    List<String> todos,
  ) {
    return CityVisit._(arrivalDate, departureDate, name, country, todos);
  }
}
