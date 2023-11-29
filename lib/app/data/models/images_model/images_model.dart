import 'dart:convert';

class ImagesModel {
  final int id;
  final List<int> base64Data; // Alterado para lista de bytes

  ImagesModel({
    required this.id,
    required this.base64Data,
  });

  // // Construtor copyWith para criar cópias com campos atualizados
  // ImagesModel copyWith({
  //   int? id,
  //   List<int>? base64Data, // Alterado para lista de bytes
  // }) {
  //   return ImagesModel(
  //     id: id ?? this.id,
  //     base64Data: base64Data ?? this.base64Data,
  //   );
  // }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      id: map['id'] ?? 0,
      base64Data: base64Decode(map['base64Data'] as String),
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'base64Data': base64Data,
  //   };
  // }
}
