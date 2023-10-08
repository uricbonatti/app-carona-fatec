class Pagamento {
  List? ra;
  List? raPago;
  int? cnh; // não visivel, só para separar o motorista dos alunos comuns
  String? pix; //pix para pagar o motorista
  double? rotaTotal; // em KM
  double?
      valorTotal; // Calculado com formula ((KM*combustivel)/kml(padrão pra cada tipo de combustivel))
  String? status;
  /*se ta em aberto ou todos pagaram
    se pagaram fica como concluido
    enquanto não esta concluido
    os RA's dos passageiros não podem mudar de pool
    O motorista pode criar outras pools enquanto isso
    a CNH separa ele dos passageiros
    ainda não definido como ver se todos pagaram ou o motorista libera o grupo
  */
}
