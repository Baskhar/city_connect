import 'dart:convert';

import '../endereco/endereco_model.dart';

class EstabelecimentoModel {
  final int id;
  final String nome;
  final String tipo;
  final String descricao;
  final List<int> fotoPerfil; // Agora é uma lista de bytes
  final EnderecoModel endereco;

  EstabelecimentoModel({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.fotoPerfil,
    required this.endereco,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'nome': nome,
  //     'tipo': tipo,
  //     'descricao': descricao,
  //     'fotoPerfil':
  //         base64Encode(fotoPerfil), // Codifica a lista de bytes para base64
  //     // 'endereco': endereco.toMap(),
  //   };
  // }

  factory EstabelecimentoModel.fromMap(Map<String, dynamic> map) {
    return EstabelecimentoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      tipo: map['tipo'] as String,
      descricao: map['descricao'] as String,
      fotoPerfil: base64Decode(map['fotoPerfil']
          as String), // Decodifica a base64 para lista de bytes
      endereco: EnderecoModel.fromMap(map['endereco'] as Map<String, dynamic>),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory EstabelecimentoModel.fromJson(String source) =>
  //     EstabelecimentoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
