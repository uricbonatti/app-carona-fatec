import 'package:flutter/material.dart';
import 'telaLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HomeAppCaronas());
}

//Teste de pools, tem que virar widgets
class HomeAppCaronas extends StatefulWidget {
  @override
  State<HomeAppCaronas> createState() => _HomeAppCaronasState();
}

class _HomeAppCaronasState extends State<HomeAppCaronas> {
  // Um alista de pool de teste
  List<Pool> yourListOfPools = [
    Pool(
      pollOwner: 'Rebeca',
      driverName: 'João',
      neighborhood: 'Bairro A',
      city: 'Cidade X',
      carModel: 'Carro A',
      passengers: 3,
    ),
    Pool(
      pollOwner: 'Maria',
      driverName: 'Maria',
      neighborhood: 'Bairro B',
      city: 'Cidade Y',
      carModel: 'Carro B',
      passengers: 4,
    ),
    Pool(
      pollOwner: 'Rebeca',
      driverName: 'João',
      neighborhood: 'Bairro A',
      city: 'Cidade X',
      carModel: 'Carro A',
      passengers: 3,
    ),
    Pool(
      pollOwner: 'Leonardo',
      driverName: 'Alfred',
      neighborhood: 'Bairro B',
      city: 'Cidade Y',
      carModel: 'Carro B',
      passengers: 3,
    ),
    Pool(
      pollOwner: 'Lucas',
      driverName: 'Lucas',
      neighborhood: 'Bairro A',
      city: 'Cidade X',
      carModel: 'Carro A',
      passengers: 1,
    ),
    Pool(
      pollOwner: 'Felipe',
      driverName: 'Caue',
      neighborhood: 'Bairro B',
      city: 'Cidade Y',
      carModel: 'Carro B',
      passengers: 3,
    ),
    Pool(
      pollOwner: 'Marcio',
      driverName: 'Marcio',
      neighborhood: 'Bairro A',
      city: 'Cidade X',
      carModel: 'Carro A',
      passengers: 4,
    ),
    Pool(
      pollOwner: 'Ruan',
      driverName: 'Thalhes',
      neighborhood: 'Bairro B',
      city: 'Cidade Y',
      carModel: 'Carro B',
      passengers: 6,
    ),
    // Adicione mais pools conforme necessário
  ];

  // Criador das guias
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red, // Defina a cor principal aqui
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Caronas Fatec Mogi Mirim'),
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Icon(Icons.directions_car,
                        color: Colors.white, size: 20.0),
                    text: 'Pools'),
                Tab(
                    icon: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    text: 'Matches'),
                Tab(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    text: 'Perfil'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              PoolsAppTab(pools: yourListOfPools), // Primeira aba
              MatchesTab(acceptedPools: yourListOfPools), // Segunda aba
              ProfileTab(), // Terceira aba
            ],
          ),
        ),
      ),
    );
  }
}

// teste de contrutor da classe pool, vai ficar fora do main
class Pool {
  final String pollOwner;
  final String driverName;
  final String neighborhood;
  final String city;
  final String carModel;
  final int passengers;

  // construtor
  Pool({
    required this.pollOwner,
    required this.driverName,
    required this.neighborhood,
    required this.city,
    required this.carModel,
    required this.passengers,
  });
}

// construtor do widget de card da pool
class PoolsAppTab extends StatelessWidget {
  final List<Pool> pools;

  PoolsAppTab({required this.pools});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pools.length,
      itemBuilder: (context, index) {
        final pool = pools[index];
        return Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dono Pool: ${pool.driverName}'),
                Text('Motorista: ${pool.driverName}'),
                Text('Bairro: ${pool.neighborhood}'),
                Text('Cidade: ${pool.city}'),
                Text('Carro: ${pool.carModel}'),
                Text('Passageiros: ${pool.passengers}'),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica para solicitar entrada na pool
                  },
                  child: Text('Solicitar Entrada'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PoolCard extends StatelessWidget {
  final Pool pool;
  final bool showChatIcon;

  PoolCard({required this.pool, this.showChatIcon = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Motorista: ${pool.driverName}'),
            Text('Bairro: ${pool.neighborhood}'),
            Text('Cidade: ${pool.city}'),
            Text('Carro: ${pool.carModel}'),
            Text('Passageiros: ${pool.passengers}'),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para solicitar entrada na pool
              },
              child: Text('Solicitar Entrada'),
            ),
            if (showChatIcon)
              // Adicione um ícone de chat, se necessário
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  // Adicione a lógica para abrir o chat
                },
              ),
          ],
        ),
      ),
    );
  }
}

class MatchesTab extends StatelessWidget {
  final List<Pool> acceptedPools;

  MatchesTab({required this.acceptedPools});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Aceita'),
        ListView.builder(
          itemCount: acceptedPools.length,
          itemBuilder: (context, index) {
            final pool = acceptedPools[index];
            return PoolCard(pool: pool, showChatIcon: true);
          },
        ),
      ],
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Adicione a foto de perfil do usuário
          CircleAvatar(
            radius: 50, // Ajuste o tamanho conforme necessário
            backgroundImage: AssetImage(
                'assets/user_profile_image.jpg'), // Substitua pelo caminho da imagem do perfil
          ),
          SizedBox(height: 20),
          // Adicione o nome do usuário
          const Text(
            'Nome do Usuário',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Adicione outras informações do usuário
          const Text(
            'Email: usuario@email.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),

          const Text(
            'Cidade: Cidade do Usuário',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),

          const Text(
            'Pools que participa:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),

          const Text(
            'Pools que gerencia:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),

          // Adicione mais informações do usuário conforme necessário
          SizedBox(height: 16),

          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Editar Perfil'),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Suas Pools'),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Pendencias de entrada'),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Pagamento'),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Ser Motorista'),
            ),
          ),

          FractionallySizedBox(
            widthFactor: 0.8,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Sair')),
          ),

          // Adicione um botão para editar o perfil

          // Adicione um botão para fazer logout
        ],
      ),
    );
  }
}
