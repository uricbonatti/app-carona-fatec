import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PoolListPage(),
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

class PoolListPage extends StatelessWidget {
  final List<Pool> pools = List.generate(20, (index) {
    return Pool(
      origin: 'Origem ${index + 1}',
      destination: 'Destino ${index + 1}',
      date: '10/${index + 1}/2023',
      availableSeats: 3,
      driverName: 'Motorista ${index + 1}',
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pools'),
      ),
      body: ListView.builder(
        itemCount: pools.length,
        itemBuilder: (context, index) {
          final pool = pools[index];
          return PoolCard(pool: pool);
        },
      ),
    );
  }
}

class PoolCard extends StatelessWidget {
  final Pool pool;

  PoolCard({required this.pool});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Origem: ${pool.origin}'),
            Text('Destino: ${pool.destination}'),
            Text('Data: ${pool.date}'),
            Text('Vagas Disponíveis: ${pool.availableSeats}'),
            Text('Motorista: ${pool.driverName}'),
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
