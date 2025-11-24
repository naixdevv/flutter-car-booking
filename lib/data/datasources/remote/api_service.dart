import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiService({this.baseUrl = "http://localhost:4000/api"})
    : defaultHeaders = {"Content-Type": "application/json"};

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse("$baseUrl$endpoint");
    final res = await http.post(
      url,
      headers: {...defaultHeaders, if (headers != null) ...headers},
      body: jsonEncode(body),
    );
    return _handleResponse(res);
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse("$baseUrl$endpoint");
    final res = await http.get(
      url,
      headers: {...defaultHeaders, if (headers != null) ...headers},
    );
    return _handleResponse(res);
  }

  Map<String, dynamic> _handleResponse(http.Response res) {
    final data = jsonDecode(res.body);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return {"success": true, "data": data};
    } else {
      return {"success": false, "message": data["message"] ?? "Unknown error"};
    }
  }
}
