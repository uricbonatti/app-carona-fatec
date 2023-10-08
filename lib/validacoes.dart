import 'package:flutter/material.dart';

class validação(){
  final boll primeiraVez = false;
  final boll aceitoutermos = false;
  final boll loginbiometrico = false;

  boll get confirmacaoprimeiravez{
    return this.primeiraVez;
  }
  
  boll get confirmacaoaceitoutermos{
    return this.aceitoutermos;
  }
  
  boll get confirmacaologinbiometrico{
    return this.loginbiometrico;
  }

  set mudandoprimeiravez{
    this.primeiravez = true;
  }

  
  set confirmandoostermos{
    this.confirmandotermo = true;
  }

  set ativacaobiometrica(bool valor){
    if (valor == true)
    this.primeiravez = true;
    else{
      this.loginbiometrico = false;
    }
  }

  



}