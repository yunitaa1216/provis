import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prak_provis/model/utils/auth_service.dart';
import 'package:prak_provis/view/widgets/bottom_navigation_bar.dart';

class MedicalRecordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> bookingData = AuthService.getBookingData();
    String? date = bookingData['date'];

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
          title: Text('Rekam Medis', 
          style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Color(0xFFBEDCF2),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: ListView(
            children: [
              // Rekam Medis section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                        child: Text(
                          'Rekam Medis',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                '${AuthService.email}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                (date ?? 'Tanggal tidak tersedia'),
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Informasi Penyakit section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                        child: Text(
                          'Informasi Penyakit',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.stethoscope,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'Jantung',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Hasil Pemeriksaan section
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                        child: Text(
                          'Hasil Pemeriksaan',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.briefcaseMedical,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              SizedBox(width: 10.0),
                              Flexible(
                                child: Text(
                                  'Berdasarkan hasil CT Scan dinyatakan pasien menderita penyakit jantung kronis',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: MyBottomNavigationBar(
        // selectedIndex: 0,
        // onItemTapped: (index) {
          
        // },
      ),
      );
    // );
  }
}
