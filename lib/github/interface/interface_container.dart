import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'http/c_http_client_app.dart';

final httpProvider = Provider((_) => CHttpClientApp());
