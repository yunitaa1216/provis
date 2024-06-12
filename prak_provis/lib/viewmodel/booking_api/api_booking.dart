// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class BookingViewModel {
//   Future<bool> bookAppointment(int doctor_id, DateTime date, String time) async {
//     try {
//       // Membuat body untuk permintaan POST
//       Map<String, dynamic> data = {
//         'doctor_id': doctor_id,
//         'date': date.toIso8601String().substring(0, 10),
//         'time': time,
//       };
    
//       final response = await http.post(
//         Uri.parse('http://localhost:3000/appointments'),
//         // headers: <String, String>{
//         //   'Content-Type': 'application/json',
//         // },
//         body: jsonEncode(data),
//       );

//       print(response.body);
    
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);

//         if (responseData['message'] == 'Appointment booked successfully.') {
//           // Jika booking berhasil

//           return true;
//         } else {
//           // Jika terjadi kesalahan pada server
//           print('Gagal melakukan booking: ${responseData['message']}');
//           return false;
//         }
//       } else {
//         // Jika respon status code bukan 200
//         print('Gagal melakukan booking: Response Status code bukan 200, tapi bernilai ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       // Jika terjadi kesalahan dalam melakukan permintaan
//       print('Error: $e');
//       return false;
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prak_provis/model/utils/auth_service.dart';

class BookingViewModel extends ChangeNotifier {
  bool _isBooking = false;
  bool get isBooking => _isBooking;
  final Dio dio = Dio();

  void booking(){
    _isBooking = true;
    notifyListeners();
  }

  Future<Response> BookingDokter({
    required int doctor_id,
    required String date,
    required String time
  }) async {
    try {
      String? token = AuthService.token;
      print('doctor_id: $doctor_id');

      Response response =await dio.post(
        'http://localhost:3000/appointments',
        data: {
          "doctor_id": doctor_id,
          "date": date,
          "time": time,
        },
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $token',
        //   },
        // ),
      );
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to booking: $error");
    }
  }
}