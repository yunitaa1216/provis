import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak_provis/model/login_model/model_login.dart';
// import 'package:women_center_mobile/Models/login_model/model_login.dart';

class LoginViewModel {
  Future<LoginResponse> loginUser(LoginData loginData) async {
    print(loginData.email);
    print(loginData.password);
    String email = loginData.email;
    String password = loginData.password;
    // String token = '';
    // token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJzb3NvQGdtYWlsLmNvbSIsImlhdCI6MTcxMzc5OTc1Nn0.cqsYnhTquP1-9aul9LI-mId2doMeY03ZG0twA6DghSI';

      Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('http://localhost:8000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token', // Gunakan token di sini
        },
        body: jsonEncode(data),
      );
      
      print(response.body);

      if (response.statusCode == 200) {
  // Memproses respons jika status code adalah 200
  final responseData = json.decode(response.body);

  if (responseData['code'] == 200 &&
      responseData['message'] == 'Authentication Success') {
    // Login berhasil
    String email = responseData['data']['email'];
    String password = responseData['data']['kata_sandi'];
    String token = responseData['data']['token'];

    await saveToSharedPreferences(email, token, password);

    return LoginResponse(sucess: true, token: token);
  } else {
    // Jika respons tidak menunjukkan keberhasilan otentikasi
    print('salah email dan password');
    return LoginResponse(sucess: false, token: "",);
  }
} else {
  // Penanganan jika respons tidak berhasil dengan status code yang bukan 200
  print(
      'Response Status code bukan 200: tapi bernilai ${response.statusCode}');
  return LoginResponse(sucess: false, token: "",);
}
    }
  }

  Future<void> saveToSharedPreferences(
    String email,
    String token,
    String password,

  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', email);
    await prefs.setString('token', token);
  }

class LoginResponse {
  final bool sucess;
  final String token;

  LoginResponse({
    required this.sucess,
    required this.token,
  });
}
