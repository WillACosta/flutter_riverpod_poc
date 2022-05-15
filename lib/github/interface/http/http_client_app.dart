import 'package:http/http.dart';

abstract class HttpClientApp {
  Future<Response> get(String url);
}
