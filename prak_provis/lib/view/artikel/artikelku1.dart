import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:prak_provis/model/artikel_model/artikel_model.dart';

class ArtikelDetailPage extends StatelessWidget {
  final ArtikelKuModel artikel;

  ArtikelDetailPage({required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Artikel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 16.0),
              Text(
                artikel.judul,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    'oleh ',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    artikel.dokter,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Image.asset(
                artikel.gambar,
              ),
              SizedBox(height: 8.0),
              Text(
                'Agar terhindar dari berbagai macam penyakit, ada banyak cara menjaga kesehatan tubuh yang bisa dilakukan. Dengan menerapkan cara-cara tersebut, kualitas hidup yang sehat dapat terjaga. Sebenarnya menerapkan berbagai cara menjaga kesehatan tubuh bukanlah hal yang sulit. Hanya saja, Anda harus konsisten dalam melakukannya. Hal ini perlu dibiasakan, mulai dari hal kecil seperti istirahat dengan cukup dan olahraga secara teratur.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                'Cara Menjaga Kesehatan Tubuh',
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                )
              ),
              SizedBox(height: 8.0),
              Text(
                'Mengubah pola hidup menjadi lebih sehat merupakan cara menjaga kesehatan tubuh yang disarankan. Beberapa pola hidup sehat yang dapat Anda jalani ',
                style: TextStyle(fontSize: 16),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
