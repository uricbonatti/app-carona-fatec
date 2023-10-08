class Pool {
  final int donoPool; //RA do aluno/motorista que criou
  final String nomePool; // nome pode ser generico mas vamos ter politicas
  List? membro;
  /*
  Dono da pool é automaticamente o promeiro mempro[0]
  Ele pode aceitar ou recusar ou banir alguem da pool
  pode ter varios pedidos até o dono fechar a pool
  */
  List? rota;
  /*
    Com os alunos entrando, pelo cadastro do endereço
    calculemos a distancia estimada da rota
    pra otimizar as pools
    mas não sabemos se estara na versão 1.0
   */
  int? tamanhoPool;
  /*
    O tamanho da pool é definido por quem a cria
    mas normalmente entre 1 ou 3
    poucos veiculos tem mais que isso
    e tem que bater com a capacidade do veiculo do motorista
    sempre tem que considerar a vaga do motorista
    no fim precisa ter o motorista e alguns membros para fechar
   */
  int? motorista; //cnh, mas não visivel, disponibiliza x lugares
  bool? aberta;
  /* mostra se é possivel se candidatar pra pool
   como motorista ou passsageiro*/

  Pool(this.donoPool, this.nomePool);
}
