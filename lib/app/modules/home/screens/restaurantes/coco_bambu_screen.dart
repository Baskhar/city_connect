import 'package:city_connect/app/common_widgets/customstarrating/custom_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching Google Maps
import '../../../../common_widgets/seta_back.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_images.dart';

class CocoBambuScreen extends StatefulWidget {
  CocoBambuScreen({super.key});

  @override
  State<CocoBambuScreen> createState() => _CocoBambuScreenState();
}

class _CocoBambuScreenState extends State<CocoBambuScreen> {
  final List<String> imageAssets = [
    AppImages.cocoBambu1,
    AppImages.cocoBambu2,
    AppImages.cocoBambu3,
    AppImages.cocoBambu4,
    AppImages.cocoBambu5,
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
                        'Coco Bambu',
                        style: TextStyle(
                          fontFamily: 'Borel',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Um lugar aconchegante, com iluminação ímpar, rico em detalhes que deixam o ambiente extremamente agradável. Tudo pensado para que os presentes no local relaxem e aproveitem o momento! Lugar de diversão. Música ao vivo todos os dias. Todos os colaboradores são devidamente treinados, simpáticos e sempre nos atendem para realmente nos agradar, mostrando que somos bem vindos ao restaurante.',
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
                            icon: Icon(Icons.location_on,
                                size: 40, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomStarRating(
                        onRatingUpdate: (rating) {
                          // Aqui você pode fazer o que quiser com o valor da classificação
                          print("Avaliação atualizada para $rating");
                        },
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
  //   const url = 'https://goo.gl/maps/MRR6ez9a2X5ejd4E8';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  void _openGoogleMaps() async {
    final Uri _url = Uri.parse('https://goo.gl/maps/MRR6ez9a2X5ejd4E8');

    //const url = 'https://goo.gl/maps/aP2U7mjoMxqU4W6L8';
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
