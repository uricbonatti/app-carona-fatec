import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DriverListPage(),
    );
  }
}

class Driver {
  final String name;
  final double score;
  final String city;
  final String neighborhood;
  final String carModel;
  final int maxPassengers;
  final String carPlate;

  Driver({
    required this.name,
    required this.score,
    required this.city,
    required this.neighborhood,
    required this.carModel,
    required this.maxPassengers,
    required this.carPlate,
  });
}

class DriverListPage extends StatelessWidget {
  final List<Driver> drivers = [
    Driver(
      name: 'Motorista 1',
      score: 4.8,
      city: 'São Paulo',
      neighborhood: 'Centro',
      carModel: 'Toyota Corolla',
      maxPassengers: 4,
      carPlate: 'ABC-1234',
    ),
    Driver(
      name: 'Motorista 2',
      score: 4.5,
      city: 'Rio de Janeiro',
      neighborhood: 'Copacabana',
      carModel: 'Honda Civic',
      maxPassengers: 4,
      carPlate: 'XYZ-5678',
    ),
    // Adicione mais motoristas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Motoristas'),
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return DriverCard(driver: driver);
        },
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final Driver driver;

  DriverCard({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${driver.name}'),
            Text('Score: ${driver.score}'),
            Text('Cidade: ${driver.city}'),
            Text('Bairro: ${driver.neighborhood}'),
            Text('Modelo do Carro: ${driver.carModel}'),
            Text('Máximo de Passageiros: ${driver.maxPassengers}'),
            Text('Placa do Carro: ${driver.carPlate}'),
          ],
        ),
      ),
    );
  }
}
