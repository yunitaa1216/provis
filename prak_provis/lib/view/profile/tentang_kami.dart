import 'package:flutter/material.dart';

class Aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          title: Text('Tentang Kami'),
          backgroundColor: Color(0xFFBEDCF2),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/pulih.png', // Ubah path gambar sesuai dengan lokasi gambar Anda
                      height: 150, // Tentukan tinggi gambar sesuai kebutuhan
                    ),
                    SizedBox(height: 20), // Jarak antara gambar dan teks
                    Text(
                      'Pulih adalah aplikasi rawat jalan yang membantu Anda mendapatkan akses mudah ke layanan kesehatan yang berkualitas. Kami berkomitmen untuk memberikan pengalaman yang nyaman dan efisien bagi pasien dalam mengelola kesehatan mereka.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20), // Jarak antara teks dan visi
                    Text(
                      'Visi kami:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10), // Jarak antara teks visi dan misi
                    Text(
                      'Menjadi platform rawat jalan terdepan yang membantu pasien pulih dengan lebih cepat dan mudah.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20), // Jarak antara misi dan detail misi
                    Text(
                      'Misi kami:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10), // Jarak antara teks misi dan poin misi
                    Text(
                      '1. Memberikan akses mudah ke layanan kesehatan yang berkualitas.\n'
                      '2. Meningkatkan efisiensi dan kenyamanan pasien dalam mengelola kesehatan mereka.\n'
                      '3. Memberikan edukasi dan informasi kesehatan yang terpercaya.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
