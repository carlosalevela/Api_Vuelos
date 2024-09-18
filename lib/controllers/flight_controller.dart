import 'package:get/get.dart';
import '../models/flight_schedule.dart';

class FlightController extends GetxController {
  var flights = <FlightSchedule>[].obs;

  
  void addFlight(FlightSchedule flight) {
    flights.add(flight);
  }

  // Método para eliminar un vuelo
  void deleteFlight(int index) {
    flights.removeAt(index);
  }
}
