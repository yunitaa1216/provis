import 'package:http/http.dart' as http;
import 'package:prak_provis/model/utils/auth_service.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prak_provis/model/login_model/model_login.dart';

class LoginViewModel {
  Future<LoginResponse> loginUser(LoginData loginData) async {
    print(loginData.email);
    print(loginData.password);
    
    String email = loginData.email;
    String password = loginData.password;
    
    try {
      Map<String, String> data = {
        'email': email,
        'kata_sandi': password,
      };
    
      final response = await http.post(
        Uri.parse('http://localhost:3000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      print(response.body);
    
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (!responseData['error'] && responseData['message'] == 'success') {
          String email = responseData['loginResult']['name'];
          String token = responseData['loginResult']['token'];
          
          await saveToSharedPreferences(email, token);
          await saveToAuthService(email, token);
          
          return LoginResponse(success: true, token: token);
        } else {
          print('salah email dan password');
          return LoginResponse(success: false, token: "");
        }
      } else {
        print('Response Status code bukan 200: tapi bernilai ${response.statusCode}');
        return LoginResponse(success: false, token: "");
      }
    } catch (e) {
      print('Error: $e');
      return LoginResponse(success: false, token: "");
    }
  }

  Future<void> saveToSharedPreferences(
    String email,
    String token,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('token', token);
  }

  Future<void> saveToAuthService(
    String email,
    String token,
  ) async {
    await AuthService.setToken(token);
    await AuthService.setEmail(email);
  }

}

class LoginResponse {
  final bool success;
  final String token;

  LoginResponse({
    required this.success,
    required this.token,
  });
}
