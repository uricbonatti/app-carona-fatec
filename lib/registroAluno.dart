import 'dart:io';

import 'package:flutter/material.dart';
import 'telaLogin.dart';
import 'package:image_picker/image_picker.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCheckedSegunda = false;
  bool isCheckedTerca = false;
  bool isCheckedQuarta = false;
  bool isCheckedQuinta = false;
  bool isCheckedSexta = false;
  bool isCheckedSabado = false;

  XFile? pickedImage; // Variável para armazenar a imagem selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Tela de Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Registro de Novo Usuário',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  final imagePicker = ImagePicker();
                  final pickedImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      this.pickedImage = pickedImage;
                    });
                  }
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: pickedImage != null
                        ? CircleAvatar(
                            radius: 56.0,
                            backgroundImage: FileImage(File(pickedImage!.path)),
                          )
                        : const Icon(
                            Icons.camera,
                            size: 56.0,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'RA (Registro Acadêmico)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Celular'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              TextFormField(
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirmação de Senha'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dias de Frequência na Faculdade:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedSegunda,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedSegunda = value!;
                    });
                  },
                ),
                const Text('Segunda')
              ]),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedTerca,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedTerca = value!;
                    });
                  },
                ),
                const Text('Terça')
              ]),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedQuarta,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedQuarta = value!;
                    });
                  },
                ),
                const Text('Quarta')
              ]),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedQuinta,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedQuinta = value!;
                    });
                  },
                ),
                const Text('Quinta')
              ]),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedSexta,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedSexta = value!;
                    });
                  },
                ),
                const Text('Sexta')
              ]),
              Row(children: <Widget>[
                Checkbox(
                  value: isCheckedSabado,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedSabado = value!;
                    });
                  },
                ),
                const Text('Sábado')
              ]),
              const SizedBox(height: 20),
              const Text(
                'Endereço:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cidade'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Rua'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bairro'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Referencia'),
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },

                  // Adicione a lógica de registro aqui

                  child: const Text('Cancelar'),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },

                  // Adicione a lógica de registro aqui

                  child: Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
