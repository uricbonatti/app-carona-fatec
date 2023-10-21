import 'package:flutter/material.dart';

class Aluno {
  final int ra;
  /* identificador principal,
    tanto para passageiro quanto para motorista,
    precisa ser aluno para ser motorista*/
  final String nomeAluno; // obrigatorio
  AssetImage fotoPerfil; // obrigatorio para o motorista reconhecer
  final String curso; //mais facil de criar pools para todo dia da semana
  String? periodo; // o periodo funciona da mesma forma
  String? email; //é preciso cadastrar o email para logar
  String? telefone; //importante para caso o motorista precise entrar em contato
  String? senha; // meio de login seguro
  Map<String, String> endereco = {
    'Rua': '',
    'numero': '',
    'bairro': '',
    'cep': '',
  }; // importante para calcular a rota e o valor
  Map<String, bool> diasSemana = {
    'segunda': false,
    'terca': false,
    'quarta': false,
    'quinta': false,
    'sexta': false,
    'sabado': false,
  }; // para saber ser os membros precisam de carona todos os dias

  Aluno(this.ra, this.nomeAluno, this.curso, this.fotoPerfil);
}
