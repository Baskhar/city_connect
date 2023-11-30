// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppServices {
  int id;
  AppServices({
    required this.id,
  });
  //static const String baseUrl = "http://10.0.2.2:8181";
  static const String baseUrl = "http://4.228.48.70:8181";

  static const String LOGIN = "/api/auth";
  static const String REGISTER = "/api/usuarios";

  static const String LISTESTABELECIMENTOS = "/api/estabelecimentos";
  static const String LISTESTABELECIMENTO = "/api/estabelecimentos/";
  //static const String FOTOSESTABELECIMENTOS = "/api/estabelecimentos/";
  //static const String REGISTER = "/api/usuarios";
  static const String AVALIACOES = "/api/avaliacoes";
}
