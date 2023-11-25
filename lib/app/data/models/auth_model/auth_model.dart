// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthModel {
  //UserModel? user;
  final String nome;
  final String email;
  final String password;
  AuthModel({
    required this.nome,
    required this.email,
    required this.password,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
        email: map['email'], password: map['password'], nome: map['nome']);
  }
}
