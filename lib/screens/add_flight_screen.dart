import 'package:flutter/material.dart';
import '../models/flight_schedule.dart';

class AddFlightScreen extends StatefulWidget {
  @override
  _AddFlightScreenState createState() => _AddFlightScreenState();
}

class _AddFlightScreenState extends State<AddFlightScreen> {
  final _formKey = GlobalKey<FormState>();

  final flightNumberController = TextEditingController();
  final airlineController = TextEditingController();
  final departureAirportController = TextEditingController();
  final arrivalAirportController = TextEditingController();
  DateTime? departureTime;
  DateTime? arrivalTime;
  double? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGREGAR VUELO '),
        backgroundColor: const Color.fromARGB(255, 7, 17, 111), 
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400, 
            minWidth: 200, 
          ),
          child: Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color.fromARGB(255, 41, 57, 206), 
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: flightNumberController,
                      decoration: InputDecoration(
                        labelText: 'Número de Vuelo',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el número de vuelo';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: airlineController,
                      decoration: InputDecoration(
                        labelText: 'Aerolínea',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el nombre de la aerolínea';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: departureAirportController,
                      decoration: InputDecoration(
                        labelText: 'Aeropuerto de Salida',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el aeropuerto de salida';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: arrivalAirportController,
                      decoration: InputDecoration(
                        labelText: 'Aeropuerto de Llegada',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el aeropuerto de llegada';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        price = double.tryParse(value);
                      },
                      validator: (value) {
                        if (value == null || double.tryParse(value) == null) {
                          return 'Por favor ingrese un precio válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final newFlight = FlightSchedule(
                              flightNumber: flightNumberController.text,
                              airline: airlineController.text,
                              departureAirport: departureAirportController.text,
                              arrivalAirport: arrivalAirportController.text,
                              departureTime: DateTime.now(), 
                              arrivalTime: DateTime.now().add(Duration(hours: 3)), 
                              price: price!,
                            );
                            Navigator.pop(context, newFlight);
                          }
                        },
                        child: Text('Agregar Vuelo', style: TextStyle(color: Colors.white)), 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 38, 97), 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
