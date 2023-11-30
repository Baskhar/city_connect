import 'dart:convert';

import '../avaliacao/avaliacao_model.dart';
import '../endereco/endereco_model.dart';

class EstabelecimentoModel {
  final int id;
  final String nome;
  final String tipo;
  final String descricao;
  final List<int> fotoPerfil; // Agora é uma lista de bytes
  final EnderecoModel endereco;
  final double mediaNotas;
  // final List<String> fotoPerfilList;
  //final List<List<String>> fotosAmbiente;
  final List<AvaliacaoModel> avaliacoes;

  EstabelecimentoModel({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.fotoPerfil,
    required this.endereco,
    required this.mediaNotas,
    //required this.fotoPerfilList,
    // required this.fotosAmbiente,
    required this.avaliacoes,
  });

  factory EstabelecimentoModel.fromMap(Map<String, dynamic> map) {
    return EstabelecimentoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      tipo: map['tipo'] as String,
      descricao: map['descricao'] as String,
      fotoPerfil: base64Decode(map['fotoPerfil'] as String),
      endereco: EnderecoModel.fromMap(map['endereco'] as Map<String, dynamic>),
      mediaNotas: map['mediaNotas'] as double,
      //  fotoPerfilList: List<String>.from(map['fotoPerfil']),
      //   fotosAmbiente: List<List<String>>.from(map['fotosAmbiente']),
      avaliacoes: (map['avaliacoes'] as List<dynamic>?)
              ?.map((e) => AvaliacaoModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'descricao': descricao,
      'fotoPerfil': base64Encode(fotoPerfil),
      'endereco': endereco.toMap(),
      'mediaNotas': mediaNotas,
      // 'fotoPerfilList': fotoPerfilList,
      // 'fotosAmbiente': fotosAmbiente,
      'avaliacoes': avaliacoes.map((e) => e.toMap()).toList(),
    };
  }
}
