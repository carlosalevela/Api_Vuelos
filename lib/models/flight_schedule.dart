class FlightSchedule {
  String flightNumber;
  String airline;
  String departureAirport;
  String arrivalAirport;
  DateTime departureTime;
  DateTime arrivalTime;
  double price;

  FlightSchedule({
    required this.flightNumber,
    required this.airline,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
  });

  String flightDetails() {
    return 'Vuelo $flightNumber con $airline de $departureAirport a $arrivalAirport, '
          'sale a las $departureTime y llega a las $arrivalTime. Precio: \$${price.toStringAsFixed(2)}';
  }
}
