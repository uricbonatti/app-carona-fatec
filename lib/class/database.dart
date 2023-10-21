import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  //Nome DB e versão
  static final _databaseName = "CaronasFatecMM.db";
  static final _databaseVersion = 1;

  //Tabela Aluno
  static final tableAluno = 'tbAluno';
  static final columnRa = '_idRA';
  static final columnNome = 'nome';
  static final columnPassword = 'password';
  static final columnCurso = 'curso';
  static final columnPeriodo = 'periodo';
  static final columnDiasSegunda = 'segunda';
  static final columnDiasTerca = 'terca';
  static final columnDiasQuarta = 'quarta';
  static final columnDiasQuinta = 'quinta';
  static final columnDiasSexta = 'sexta';
  static final columnDiasSabado = 'sabado';
  static final columnCidade = 'cidade';
  static final columnRua = 'rua';
  static final columnBairro = 'bairro';
  static final columnNumeroCasa = 'numero';
  static final columnCep = 'cep';

  //Motorista
  static final tableMotorista = 'tbMotorista';
  static final columnIdMotorista = '_idMotorista';
  static final columnCnh = 'cnhMotorista';
  static final columnPix = 'chavePix';
  static final columnVeiculo = 'tipoVeiculo';
  static final columnQuantidade = 'qtdPassageiros';
  static final columnPlaca = 'placaVeiculo';
  static final columnModelo = 'modeloVeiculo';
  static final columnCor = 'corVeiculo';
  static final columnCombustivel = 'combustivelVeiculo';

  //Polls
  static final tablePools = 'tbPools';
  static final columnIdPools = '_idPools';
  static final columnAluno = '_idRa';
  static final columnMotoristas = '_idMotorista';
  static final columnNomePool = 'nomePool';
  static final columnAdministrador = 'poolAdministrador';
  static final columnTamanhoPool = 'tamanhoPool';
  static final columnMembro = 'poolMembros';
  static final columnCorrida = 'inicioCorrida';
  static final columnPoolStatus = 'poolStatus';

  //Chat
  static final tableChats = 'tbChat';
  static final columnIdChat = '_idChat';
  static final columnMotorista = '_idMotorista';
  static final columnDataHora = 'dataHoraChat';
  static final columnIdPool = '_idPools';

  //Pagamento Corrida

  static final tableCorrida = 'tbCorrida';
  static final columnIdPagamento = '_idPagamento';
  static final columnIdMotoristas = '_idMotorista';
  static final columnPools = '_idPool';
  static final columnRota = 'rotaPercorida';
  static final columnValor = 'valorTotal';
  static final columnPagamentoStatus = 'statusPagamento';

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // tem somente uma referência ao banco de dados
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  // abre o banco de dados e o cria se ele não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableAluno (
            $columnRa INTEGER PRIMARY KEY,
            $columnNome TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,
            $columnCurso TEXT NOT NULL,
            $columnPeriodo TEXT NOT NULL,
            $columnDiasTerca INTEGER,
            $columnDiasQuarta INTEGER,
            $columnDiasQuinta INTEGER,
            $columnDiasSexta INTEGER,
            $columnDiasSabado INTEGER,
            $columnCidade TEXT NOT NULL,
            $columnRua TEXT NOT NULL,
            $columnBairro TEXT NOT NULL,
            $columnNumeroCasa INTEGER NOT NULL,
            $columnCep INTEGER NOT NULL,
            
          ),
          CREATE TABLE $tableMotorista (
            $columnIdMotorista INTEGER PRIMARY KEY,
            $columnCnh INTEGER NOT NULL,
            $columnPix TEXT NOT NULL,
            $columnVeiculo TEXT NOT NULL,
            $columnQuantidade INTEGER NOT NULL,
            $columnPlaca STRING NOT NULL,
            $columnModelo STRING NOT NULL,
            $columnCor STRING NOT NULL,
            $columnCombustivel STRING NOT NULL,
          ),

          CREATE TABLE $tablePools (
            $columnIdPools INTEGER PRIMARY KEY,
            $columnAluno INTEGER NOT NULL,
            $columnMotorista INTEGER NOT NULL,
            $columnNomePool TEXT NOT NULL,
            $columnAdministrador TEXT NOT NULL,
            $columnTamanhoPool INTEGER NOT NULL,
            $columnMembro STRING NOT NULL,
            $columnCorrida STRING NOT NULL,
            $columnPoolStatus TEXT NOT NULL
          ),
          CREATE TABLE $tableCorrida (
            $columnIdPagamento INTEGER PRIMARY KEY,
            $columnIdMotoristas INTEGER NOT NULL,
            $columnPools INTEGER NOT NULL,
            $columnRota TEXT NOT NULL,
            $columnValor REAL NOT NULL,
            $columnPagamentoStatus TEXT NOT NULL
          ),

          ''');
  }
}
