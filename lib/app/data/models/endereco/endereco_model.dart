// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EnderecoModel {
  // final int id;
  // final String logradouro;
  // final String bairro;
  // final String cep;
  // final String numero;
  // final String cidade;
  // final String uf;
  final String linkMaps;

  EnderecoModel({
    // required this.id,
    // required this.logradouro,
    // required this.bairro,
    // required this.cep,
    // required this.numero,
    // required this.cidade,
    // required this.uf,
    required this.linkMaps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      // 'logradouro': logradouro,
      // 'bairro': bairro,
      // 'cep': cep,
      // 'numero': numero,
      // 'cidade': cidade,
      // 'uf': uf,
      'linkMaps': linkMaps,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      // id: map['id'] as int,
      // logradouro: map['logradouro'] as String,
      // bairro: map['bairro'] as String,
      // cep: map['cep'] as String,
      // numero: map['numero'] as String,
      // cidade: map['cidade'] as String,
      // uf: map['uf'] as String,
      linkMaps: map['linkMaps'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
