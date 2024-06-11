// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:prak_provis/model/utils/auth_service.dart';

// class ProfilViewModel with ChangeNotifier {
//   void updateToken(String newToken) {
//     AuthService.token = newToken;
//     notifyListeners();
//   }
// }

// class ApiProfil {
//   final Dio _dio = Dio();

//   Future<Map<String, dynamic>> getUserProfile() async {
//     try {
//       // Mengambil token dari AuthService
//       String? token = AuthService.token;

//       final response = await _dio.get(
//         'http://localhost:8000/profil',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = response.data;
//         print('Email: ${data['userProfile']['email']}');
//         return data['userProfile'];
//       } else {
//         throw Exception('Failed to load user profile');
//       }
//     } catch (error) {
//       if (error is DioError) {
//         if (error.response != null) {
//           print('Error response data: ${error.response?.data}');
//           print('Error response headers: ${error.response?.headers}');
//           print('Error response request: ${error.response?.requestOptions}');
//         } else {
//           print('Error message: ${error.message}');
//         }
//       }
//       throw Exception('Failed to load user profile: $error');
//     }
//   }
// }

// // import 'package:dio/dio.dart';
// // import 'package:prak_provis/model/utils/auth_service.dart';
// // // import 'auth_service.dart'; // Adjust the import path as needed

// // class ApiProfil {
// //   final Dio _dio = Dio();

// //   Future<Map<String, dynamic>> getUserProfile() async {
// //     try {
// //       String token = await AuthService.getToken();

// //       if (token.isEmpty) {
// //         throw Exception('Token is not available. Please log in.');
// //       }

// //       final response = await _dio.get(
// //         'http://localhost:8000/profil',  // Replace with your actual API URL
// //         options: Options(headers: {'Authorization': 'Bearer $token'}),
// //       );

// //       if (response.statusCode == 200) {
// //         return response.data;
// //       } else {
// //         throw Exception('Failed to load user profile');
// //       }
// //     } catch (error) {
// //       throw Exception('Failed to load user profile: $error');
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// // import 'package:prak_provis/model/user_profile.dart';
// // import 'package:prak_provis/model/api/api_profil.dart';
// import 'package:prak_provis/viewmodel/api_profil/api_profil.dart';

// import '../../model/profil_model/profil_user_model.dart';
// import '../../model/utils/auth_service.dart';

// class ProfilViewModel with ChangeNotifier {
//   UserProfile? _userProfile;

//   UserProfile? get userProfile => _userProfile;

//   Future<void> loadUserProfile() async {
//     try {
//       _userProfile = await ApiProfil().getUserProfile();
//       notifyListeners();
//     } catch (e) {
//       print('Error loading user profile: $e');
//     }
//   }

//   void updateToken(String newToken) {
//     AuthService.token = newToken;
//     notifyListeners();
//   }
// }

