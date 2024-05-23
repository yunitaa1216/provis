import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:prak_provis/model/artikel_model/artikel_model.dart';
import 'package:prak_provis/View/artikel/artikel_widget.dart';
import 'package:prak_provis/view/widgets/bottom_navigation_bar.dart';

class Artikel extends StatelessWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ArtikelKuModel> artikelList = [
      ArtikelKuModel("assets/images/artikelku1.jpg", "Dokter Dian Safitri",
          "Cara Menjaga Kesethatan Tubuh Agar Terhindar dari Peyakit"),
      ArtikelKuModel(
        "assets/images/artikelku2.jpg",
        "Dokter Syifa Nur Rahmawati",
        "Waspada! 5 Gejala awal Kanker yang Sering Diabaikan",
      ),
      ArtikelKuModel(
        "assets/images/artikelku3.jpg",
        "Dokter Julia Amalia",
        "Pentingnya Menjaga Kesehatan Mental di Era Digital",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 96,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0),
            child: Text(
              'Artikel',
              style: TextStyle(
                // Use the Google Fonts class
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ArtikelWidget(artikelList: artikelList),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 0) {
      Navigator.pushNamed(context, '/homepage');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/booking');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/info');
    } else if (index == 4) {
      Navigator.pushNamed(context, '/profil');
    }
        },
      ),
    );
  }
}