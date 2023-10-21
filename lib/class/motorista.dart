class Motorista {
  final int cnh;
  /*
    Para ser motorista precisa ter RA
    Mas a CNH diferencia ele no sistema
    No caso ele precisa fornecer dados adicionais
    E recebe o pagamento
   */
  int? chavePix; //Cadastro da forma de pagamento
  Map<String, String> veiculo = {
    'tipo': '',
    'capacidade': '',
    'modelo': '',
    'cor': '',
    'placa': '',
    'combustivel': '',
  };

  /*
      tipo: saber se é moto carro ou outros
      capacidade: capacidade que ele consegue levar
      considerando a capacidade do veiculo pela lei
      modelo: importante para indentificação dos passageiros
      cor: igual o item acima
      placa: bom para os passageiros indentificar, e a Fatec ter controle
      no futuro
      Combustivel: usado para o valor final da corrida, vamos estipular
      valores fixos para cada tipo
       de combustivel (Gasolina, Alcool, Gnv, Eletrico, Hibrido)
    
     */

  Motorista(this.cnh);
}
