import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prak_provis/model/utils/auth_service.dart';
import 'package:prak_provis/view/booking/pemesanan_sukses.dart';
import 'dart:convert';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  String? selectedDoctor;

  List<String> availableTimes = ['09:00', '11:00', '13:00', '15:00'];

  Future<List<Map<String, dynamic>>> getDoctors() async {
    final response = await http.get(Uri.parse('http://localhost:3000/doctors'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  Future<http.Response> bookAppointment(int doctorId, String date, String time) async {
    final url = Uri.parse('http://localhost:3000/appointments');
    final headers = {'Content-Type': 'application/json'};

    String? token = AuthService.token;
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    } else {
      throw Exception('User not Authenticated!');
    }

    final body = json.encode({
      'doctor_id': doctorId,
      'date': date,
      'time': time,
    });

    return await http.post(url, headers: headers, body: body);
  }

  void _showBookingConflictDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Gagal'),
          content: Text('Jadwal sudah di-booking, silakan pilih jadwal lain.'),
          actions: [
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Form',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFBEDCF2),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: getDoctors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, dynamic>> doctors = snapshot.data!;
                  return DropdownButtonFormField<String>(
                    value: selectedDoctor,
                    hint: Text('Select Doctor'),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDoctor = newValue!;
                      });
                    },
                    items: doctors.map((doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor['id'].toString(),
                        child: Text(doctor['name']),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedTime,
              hint: Text('Select Time'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue;
                });
              },
              items: availableTimes.map((time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                if (selectedDoctor != null && selectedDate != null && selectedTime != null) {
                  try {
                    var response = await bookAppointment(
                      int.parse(selectedDoctor!),
                      selectedDate.toIso8601String().substring(0, 10),
                      selectedTime!,
                    );

                    if (response.statusCode == 200) {
                      print('Appointment booked successfully.');
                      AuthService.saveBookingData({
                        'doctorId': int.parse(selectedDoctor!),
                        'date': selectedDate.toIso8601String().substring(0, 10),
                        'time': selectedTime!,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PemesananSukses()),
                      );
                    } else if (response.statusCode == 400) {
                      _showBookingConflictDialog(context);
                    } else {
                      print('Failed to book appointment: ${response.body}');
                    }
                  } catch (error) {
                    print('Error: $error');
                  }
                } else {
                  print('Harap lengkapi data booking');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                backgroundColor: const Color(0xFF3C96E9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: const Text(
                'Booking',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
