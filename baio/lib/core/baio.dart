import 'package:http/http.dart' as http;

class BaioClient extends http.BaseClient {
  final http.Client _inner;
  String token;

  BaioClient(this.token, this._inner);

  updateToken(String token) {
    this.token = token;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['authorization'] = "bearer $token";
    return _inner.send(request);
  }
}
