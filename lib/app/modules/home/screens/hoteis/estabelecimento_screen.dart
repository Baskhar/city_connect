import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_connect/app/common_widgets/seta_back.dart';
import 'package:city_connect/app/constants/app_colors.dart';
import 'package:city_connect/app/data/http/http_cliente.dart';
import 'package:city_connect/app/data/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:city_connect/app/common_widgets/customstarrating/custom_star_rating.dart';
import 'package:city_connect/app/data/token/token.dart';
import 'package:city_connect/app/modules/home/screens/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../widgets/comment_input.dart';
// import '../../../common_widgets/seta_back.dart';
// import '../../../constants/app_colors.dart';
// import '../../../constants/app_images.dart';
// import '../../../data/http/http_cliente.dart';
// import '../../../data/repositories/home_repository.dart';

class EstabelecimentoScreen extends StatefulWidget {
  EstabelecimentoScreen({super.key});

  @override
  State<EstabelecimentoScreen> createState() => _EstabelecimentoScreenState();
}

class _EstabelecimentoScreenState extends State<EstabelecimentoScreen> {
  final List<String> imageAssets = [
    // AppImages.luzeirosImg1,
    // AppImages.luzeirosImg2,
    // AppImages.luzeirosImg3,
    // AppImages.luzeirosImg4,
    // AppImages.luzeirosImg5,
  ];
  final store = HomeStore(
    repository: EstabelcimentosRepository(
      cliente: HttpCliente(token: Modular.get<Token>()),
    ),
  );

  final Token token = Modular.get<Token>();
  List<String> comments = [];
  String _tempComment = '';

  @override
  Widget build(BuildContext context) {
    final int? estabelecimentoId =
        ModalRoute.of(context)?.settings.arguments as int?;
    store.loadEstabelecimento(estabelecimentoId!);

    store.loadImages(estabelecimentoId);
    return Scaffold(
      body: _buildBody(),
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
              _tempComment = value;
            },
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            setState(() {
              comments.add(_tempComment);
              _tempComment = '';
            });
          },
          icon: Icon(Icons.send),
        ),
      ],
    );
  }

  void _openGoogleMaps() async {
    print(store.currentEstabelecimento?.endereco.linkMaps);
    final Uri _url = await Uri.parse(
        store.currentEstabelecimento?.endereco.linkMaps ?? 'google.com.br');
    if (await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) {
        if (store.loading) {
          return _buildLoading();
        } else if (store.error) {
          return _buildError();
        } else if (store.sucess) {
          return _buildSuccess();
        } else {
          return Container(); // Estado inicial
        }
      },
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text('Erro ao carregar estabelecimento'),
    );
  }

  Widget _buildSuccess() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
        ),
        child: Column(children: [
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
                    Stack(
                      children: [
                        CarouselSlider(
                          items: (store.getImage ?? []).isEmpty
                              ? [
                                  // Se a lista estiver vazia, exibe um item com um texto
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text(
                                        'Nenhuma Imagem cadastrada',
                                        style: TextStyle(
                                          fontFamily: 'Borel',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              : (store.getImage ?? []).map((imageModel) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.memory(Uint8List.fromList(
                                                imageModel.base64Data))
                                            .image,
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
                              store.currentEstabelecimento?.nome ??
                                  'Nome vazio',
                              style: TextStyle(
                                fontFamily: 'Borel',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              store.currentEstabelecimento?.descricao ??
                                  'Descrição vazia',
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
                            CustomStarRating(
                              onRatingUpdate: (rating) {
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
                                  thickness: 2,
                                  color: AppColors.black,
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8.0),
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
                            CommentInput(
                              onCommentAdded: (comment) {
                                // setState(() {
                                //   comments.add(comment);
                                // });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
