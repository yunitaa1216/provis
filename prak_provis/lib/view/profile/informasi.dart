import 'package:flutter/material.dart';
import 'package:prak_provis/model/utils/auth_service.dart';
import 'package:prak_provis/view/profile/rekam_medis.dart';
import 'package:prak_provis/view/profile/resep_obat.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> bookingData = AuthService.getBookingData();
    String? date = bookingData['date'];
    String? time = bookingData['time'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          title: Text('Informasi', style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Color(0xFFBEDCF2),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: ListView(
            children: [
              // Informasi section
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman rekam_medis.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicalRecordApp()),
                  );
                },
                 child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/profil/1.png'),
                            ),
                            SizedBox(width: 16.0),
                            Text(
                              'Rekam Medis',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text(
                              '${AuthService.email}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          height: 1.0,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 8.0),
                            Text(date ?? 'Tanggal tidak tersedia'),
                            Spacer(),
                            Icon(Icons.access_time),
                            SizedBox(width: 8.0),
                            Text(time ?? 'Waktu tidak tersedia'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Obat section
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman info_obat.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recipe()),
                  );
                },
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/images/info_obat.png'),
                            ),
                            SizedBox(width: 16.0),
                            Text(
                              'Obat',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text(
                              '${AuthService.email}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Container(
                          height: 1.0,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 8.0),
                            Text(date ?? 'Tanggal tidak tersedia'),
                            Spacer(),
                            Icon(Icons.access_time),
                            SizedBox(width: 8.0),
                            Text('09:00-11:00'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
