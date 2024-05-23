import 'package:flutter/material.dart';
// import 'artikel_model.dart'; // Import kelas Artikel dari file artikel_model.dart
import 'package:prak_provis/model/artikel_model/artikel_model.dart';

class LatestArtikel extends StatefulWidget {
  final Function(int index) pindahHalaman;
  final ArtikelKuModel artikel; // Tambahkan properti artikel
  const LatestArtikel({Key? key, required this.pindahHalaman, required this.artikel}) : super(key: key);

  @override
  State<LatestArtikel> createState() => _LatestArtikelState();
}

class _LatestArtikelState extends State<LatestArtikel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Artikel Untukmu',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextButton(
              onPressed: () {
                widget.pindahHalaman(1);
              },
              child: const Text(
                'Selengkapnya',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color(0xFF646464),
                ),
              ),
            ),
          ],
        ),
        fromAPI(),
      ],
    );
  }

  Widget fromAPI() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/artikelku3.jpg',
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.artikel.dokter, // Gunakan properti author dari objek artikel
                style: TextStyle(
                  color: Color(0xFF787878),
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.artikel.judul, // Gunakan properti title dari objek artikel
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.artikel.gambar, // Gunakan properti content dari objek artikel
            softWrap: true,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16.0,
              color: Color(0xFFA5A5A5),
            ),
          ),
        ],
      ),
    );
  }
}