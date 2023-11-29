import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/repositories/home_repository.dart';
import 'package:city_connect/app/data/token/token.dart';
import 'package:city_connect/app/modules/home/screens/home_store.dart';
import 'package:city_connect/app/modules/home/screens/hoteis_screen.dart';
import 'package:city_connect/app/modules/home/screens/restaurantes_screen.dart';

import 'pontos_turisticos_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final store = HomeStore(
    repository: EstabelcimentosRepository(
      cliente: HttpCliente(token: Modular.get<Token>()),
    ),
  );

  final Token token = Modular.get<Token>();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    store.listEstabecimentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Seja bem-vindo ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Modular.to.pushReplacementNamed('/login/');
              },
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (_) => _buildBody(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.hotel),
          Icon(Icons.restaurant),
          Icon(Icons.location_on),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    if (store.loading) {
      return Center(child: CircularProgressIndicator());
    } else if (store.sucess) {
      switch (_selectedIndex) {
        case 0:
          return HoteisScreen(
              estabelecimentos: store.filterEstabelecimentosByType('HOTEL'));
        case 1:
          return RestaurantesScreen(
              estabelecimentos:
                  store.filterEstabelecimentosByType('RESTAURANTE'));
        case 2:
          return PontosTuristicosScreen(
              estabelecimentos:
                  store.filterEstabelecimentosByType('PONTOSTURISTICOS'));
        default:
          return Container();
      }
    } else if (store.error) {
      return Center(
        child: Text('Não foi possível exibir os estabelecimentos'),
      );
    } else {
      return Container(); // Estado inicial
    }
  }
}
