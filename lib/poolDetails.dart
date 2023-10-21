import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PoolDetailsPage(),
    );
  }
}

class PoolDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Suponha que você tenha um objeto "pool" com os detalhes da pool atual
    final Pool pool = Pool(
      origin: 'Campus A',
      destination: 'Campus B',
      date: '10/25/2023',
      availableSeats: 3,
      driverName: 'João',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Pool'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Origem: ${pool.origin}'),
            Text('Destino: ${pool.destination}'),
            Text('Data: ${pool.date}'),
            Text('Vagas Disponíveis: ${pool.availableSeats}'),
            Text('Motorista: ${pool.driverName}'),
            SizedBox(height: 20),
            Text(
              'Rota da Carona no Mapa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 200, // Defina a altura desejada
              // Adicione aqui um widget de mapa ou imagem para exibir a rota
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para entrar na pool selecionada
              },
              child: Text('Entrar na Carona'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pool {
  final String origin;
  final String destination;
  final String date;
  final int availableSeats;
  final String driverName;

  Pool({
    required this.origin,
    required this.destination,
    required this.date,
    required this.availableSeats,
    required this.driverName,
  });
}
