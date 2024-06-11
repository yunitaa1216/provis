// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class DoctorApi {
//   static Future<List<dynamic>> fetchDoctors() async {
//     final response = await http.get(Uri.parse('http://localhost:3000/doctors'));

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prak_provis/model/dokter_model/dokter_model.dart';
// import 'doctor_model.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctors = [];
  bool _isLoading = false;

  List<Doctor> get doctors => _doctors;
  bool get isLoading => _isLoading;

  Future<void> fetchDoctors() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('http://localhost:3000/doctors'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _doctors = data.map((json) => Doctor.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
