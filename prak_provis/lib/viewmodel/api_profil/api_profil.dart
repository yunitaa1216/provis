// import 'package:dio/dio.dart';
// import '../../model/profil_model/profil_user_model.dart';
// // import 'user_profile.dart';
// import 'package:prak_provis/model/utils/auth_service.dart';

// class ApiProfil {
//   final Dio _dio = Dio();

//   Future<UserProfile> getUserProfile() async {
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
//         print('Email: ${data['email']}');
//         return UserProfile.fromJson(data);
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

import 'package:dio/dio.dart';
import 'package:prak_provis/model/utils/auth_service.dart';

class ApiProfil {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUserProfile(String email, String password) async {
    try {
      String? token = AuthService.token;

      final response = await _dio.post(
        'http://localhost:3000/profil',
        data: {
          'email': email,
          'kata_sandi': password,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return data['userProfile'];
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      throw Exception('Failed to load user profile: $error');
    }
  }
}
