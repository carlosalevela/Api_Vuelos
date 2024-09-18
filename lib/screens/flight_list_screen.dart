import 'package:flutter/material.dart';
import '../models/flight_schedule.dart';
import 'add_flight_screen.dart';

class FlightListScreen extends StatefulWidget {
  @override
  _FlightListScreenState createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  List<FlightSchedule> flights = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FLIGHTS ALI',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: const Color.fromARGB(255, 7, 17, 111), 
      ),
      body: flights.isEmpty
          ? Center(child: Text('No hay vuelos disponibles.', style: TextStyle(fontSize: 18, color: Colors.grey[600])))
          : ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text('${flight.airline} - ${flight.flightNumber}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        'Salida: ${flight.departureTime} - Llegada: ${flight.arrivalTime}'),
                    trailing: Text('\$${flight.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green[700])),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newFlight = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFlightScreen()),
          );
          if (newFlight != null) {
            setState(() {
              flights.add(newFlight);
            });
          }
        },
        backgroundColor: const Color.fromARGB(255, 1, 30, 80), 
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.airplanemode_active,
              color: Colors.white, 
            ),
            SizedBox(width: 5), 
            Text(
              "+",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
