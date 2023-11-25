class UserModel {
  final String nome;
  final String token;

  UserModel({
    required this.nome,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      token: map['token'],
    );
  }
}
