import 'package:city_connect/app/common_widgets/customstarrating/custom_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching Google Maps
import '../../../../common_widgets/seta_back.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';

class CabanaDoSolScreen extends StatefulWidget {
  CabanaDoSolScreen({super.key});

  @override
  State<CabanaDoSolScreen> createState() => _CabanaDoSolScreenState();
}

class _CabanaDoSolScreenState extends State<CabanaDoSolScreen> {
  final List<String> imageAssets = [
    AppImages.cabanaDoSol1,
    AppImages.cabanaDoSol2,
    AppImages.cabanaDoSol3,
    AppImages.cabanaDoSol4,
    AppImages.cabanaDoSol5,
  ];

  List<String> comments = []; // List to store user comments
  String _tempComment = ''; // Temporary variable to store comment input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: AppColors.black
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [Color(0xFF0073E6), Color(0xFF00C6FF)],
              // ),
              ),
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: imageAssets.map((asset) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(asset),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enableInfiniteScroll: true,
                      pauseAutoPlayOnTouch: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: SetaBack(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: AppColors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cabana do Sol',
                        style: TextStyle(
                          fontFamily: 'Borel',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Desde a sua fundação, em novembro de 1994, na cidade de São Luís, o Restaurante Cabana do Sol tem a sua história focada no respeito ao cliente e amor pelo que faz.No Restaurante Cabana do Sol, localizado em São Luís e Imperatriz, você pode saborear pratos da cozinha brasileira com destaque especial para a deliciosa culinária maranhense como a carne de sol do norte, o arroz de cabrito, o capote, a galinha da terra e o peixe frito com arroz de cuxá. O Guia Quatro Rodas elegeu, o Cabana do Sol como um dos melhores do país.',
                        style: TextStyle(
                          fontFamily: 'Borel',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              'Nota: 9.0',
                              style: TextStyle(
                                fontFamily: 'Borel',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _openGoogleMaps();
                            },
                            icon: Icon(
                              Icons.location_on,
                              size: 40,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Comentários',
                        style: TextStyle(
                          fontFamily: 'Borel',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomStarRating(
                        onRatingUpdate: (rating) {
                          // Aqui você pode fazer o que quiser com o valor da classificação
                          print("Avaliação atualizada para $rating");
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: AppColors.black,
                          ),
                        ),
                        child: ListView.separated(
                          itemCount: comments.length,
                          separatorBuilder: (context, index) => Divider(
                            thickness: 2, // Aumenta a grossura da linha
                            color: AppColors.black, // Cor da linha divisória
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(
                                comments[index],
                                style: TextStyle(
                                  fontFamily: 'Borel',
                                  fontSize: 16,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildCommentInput(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Digite um comentário...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) {
              // Store the comment in a temporary variable
              _tempComment = value;
            },
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            // Add the comment to the list of comments
            setState(() {
              comments.add(_tempComment); // Add the stored comment
              _tempComment = ''; // Clear the temporary comment
            });
          },
          icon: Icon(Icons.send),
        ),
      ],
    );
  }

  // void _openGoogleMaps() async {
  //   const url = 'https://goo.gl/maps/7niwFJJbrW36MbTc9';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  void _openGoogleMaps() async {
    final Uri _url = Uri.parse('https://goo.gl/maps/7niwFJJbrW36MbTc');

    //const url = 'https://goo.gl/maps/aP2U7mjoMxqU4W6L8';
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
