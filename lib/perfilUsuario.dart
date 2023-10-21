import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Suponha que você tenha uma URL da foto do usuário
    final String userProfileImage =
        'https://example.com/user-profile-image.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60, // Ajuste o tamanho conforme necessário
                backgroundImage: NetworkImage(userProfileImage),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Meu Perfil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: 'Nome do Usuário',
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              initialValue: 'RA do Usuário',
              decoration: InputDecoration(labelText: 'RA (Registro Acadêmico)'),
            ),
            TextFormField(
              initialValue: 'E-mail do Usuário',
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              obscureText: true,
              initialValue: 'Senha do Usuário',
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            TextFormField(
              initialValue: 'Curso do Usuário',
              decoration: InputDecoration(labelText: 'Curso'),
            ),
            TextFormField(
              initialValue: 'Período do Usuário',
              decoration: InputDecoration(labelText: 'Período'),
            ),
            TextFormField(
              initialValue: 'Dias de Frequência na Faculdade do Usuário',
              decoration:
                  InputDecoration(labelText: 'Dias de Frequência na Faculdade'),
            ),
            TextFormField(
              initialValue: 'Endereço Completo do Usuário',
              decoration: InputDecoration(labelText: 'Endereço Completo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para salvar as alterações no perfil
              },
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
