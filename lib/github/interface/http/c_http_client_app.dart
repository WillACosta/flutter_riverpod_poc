import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'http_client_app.dart';

class CHttpClientApp implements HttpClientApp {
  @override
  Future<Response> get(String url) {
    final parsedUrl = Uri.parse(url);
    return http.get(parsedUrl);
  }
}
