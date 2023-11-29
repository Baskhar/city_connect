// import 'package:city_connect/app/modules/home/widgets/card_pontos.dart';
// import 'package:flutter/material.dart';

// import '../screens/hoteis_screen.dart';
// import '../screens/restaurantes_screen.dart';
// import '../screens/pontos_turisticos_screen.dart';

// class CustomListCardsPontos extends StatelessWidget {
//   const CustomListCardsPontos({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HoteisScreen()));
//               },
//               child: CardPontos(title: 'Hoteis')),
//           InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => RestaurantesScreen()));
//               },
//               child: CardPontos(title: 'Restaurantes')),
//           InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => PontosTuristicosScreen()));
//               },
//               child: CardPontos(title: 'Pontos Turisticos')),
//         ],
//       ),
//     );
//   }
// }
