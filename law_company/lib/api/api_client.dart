import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'http://172.20.10.13:3000/api';

  String? _login;
  String? _password;

  ApiClient([this._login, this._password]);

  bool get isLoggedIn => _login != null && _password != null;

  void login(String login, String password) {
    _login = login;
    _password = password;
  }

  void logout() {
    _login = null;
    _password = null;
  }

  Future<void> loginCheck() async {
    if (_login == null || _password == null) {
      throw Exception('Не задан логин или пароль');
    }

    log('Attempting login for user: $_login');

    final response = await http.post(
      Uri.parse('$baseUrl/auth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'login': _login,
        'password': _password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Auth error');
    }
  }

  Future<List<dynamic>> getClients() => _get('clients');
  Future<List<dynamic>> getLawyers() => _get('lawyers');
  Future<List<dynamic>> getRequests() => _get('requests');
  Future<List<dynamic>> getServices() => _get('services');
  Future<List<dynamic>> getProvidedServices() => _get('provided-services');

  Future<List<dynamic>> _get(String endpoint) async {
    if (!isLoggedIn) throw Exception('Неавторизован');

    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'x-login': _login!,
        'x-password': _password!,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Load error: $endpoint');
    }

    return jsonDecode(response.body);
  }
}
