import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _isRegistered = false;

  bool get isRegistered => _isRegistered;

  void register() {
    _isRegistered = true;
    notifyListeners();
  }

  Future<Response> registerUser({
    required String nama_lengkap,
    required String no_hp,
    required String email,
    required String kata_sandi,
    required String konfirmasi_kata_sandi,
    required String tanggal_lahir,
  }) async {
    try {
      print("Registering user with data:");
      print("Nama Lengkap: $nama_lengkap");
      print("No HP: $no_hp");
      print("Email: $email");
      print("Kata Sandi: $kata_sandi");
      print("Konfirmasi Kata Sandi: $konfirmasi_kata_sandi");
      print("Tanggal Lahir: $tanggal_lahir");
      
      Response response = await Dio().post(
        'http://localhost:3000/register',
        data: {
          "nama_lengkap": nama_lengkap,
          "email": email,
          "kata_sandi": kata_sandi,
          "no_hp": no_hp,
          "tanggal_lahir": tanggal_lahir,
          "konfirmasi_kata_sandi": konfirmasi_kata_sandi
        },
      );
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to register user: $error");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool obscureText = true;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }
}

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RegisterViewModel {
//   Future<void> registerUser({
//     required String fullName,
//     required String phoneNumber,
//     required String birthDate,
//     required String email,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     try {
//       Map<String, String> data = {
//         'nama_lengkap': fullName,
//         'no_hp': phoneNumber,
//         'tanggal_lahir': birthDate,
//         'email': email,
//         'kata_sandi': password,
//         'konfirmasi_kata_sandi': confirmPassword,
//       };

//       final response = await http.post(
//         Uri.parse('http://localhost:8000/register'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );

//       // Handle response accordingly
//       print(response.body);
//     } catch (e) {
//       // Handle error accordingly
//       print('Error: $e');
//     }
//   }
// }

// void main() {
//   RegisterViewModel registerViewModel = RegisterViewModel();

//   String fullName = 'Yunita Anggeraini';
//   String phoneNumber = '082345678910';
//   String birthDate = '2003-06-16';
//   String email = 'yunn@gmail.com';
//   String password = 'Yun123';
//   String confirmPassword = 'Yun123';

//   registerViewModel.registerUser(
//     fullName: fullName,
//     phoneNumber: phoneNumber,
//     birthDate: birthDate,
//     email: email,
//     password: password,
//     confirmPassword: confirmPassword,
//   );
// }