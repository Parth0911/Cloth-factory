import 'package:http/http.dart' as http;

class ApiService {
  static Future getMethod(Uri url) async {
    return await http.get(url);
    // http.Response;
  }
}
