class AvaliacaoModel {
  final String nomeUsuario;
  final String comentario;

  AvaliacaoModel({
    required this.nomeUsuario,
    required this.comentario,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomeUsuario': nomeUsuario,
      'comentario': comentario,
    };
  }

  factory AvaliacaoModel.fromMap(Map<String, dynamic> map) {
    return AvaliacaoModel(
      nomeUsuario: map['nomeUsuario'] as String,
      comentario: map['comentario'] as String,
    );
  }
}
