import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreatePoolPage(),
    );
  }
}

class CreatePoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar uma Pool'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Criar uma Nova Pool',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Origem'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data'),
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Número de Vagas Disponíveis'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para criar a pool
              },
              child: Text('Criar Pool'),
            ),
          ],
        ),
      ),
    );
  }
}
