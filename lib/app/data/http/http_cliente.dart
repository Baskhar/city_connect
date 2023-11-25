import 'package:http/http.dart' as http;

abstract class IhttpCliente {
  Future get({required String url});
  Future post({required String url, dynamic body});
}

class HttpCliente implements IhttpCliente {
  final client = http.Client();
  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future post({required String url, dynamic body}) async {
    final response = await client.post(
      Uri.parse(url),
      body: body,
    );
    return response;
  }
}
