import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prak_provis/view/homepage/artikel_homepage.dart';
import 'package:prak_provis/view/homepage/homepage_2.dart';
import 'package:prak_provis/view/homepage/homepageutama.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomepageSection extends StatefulWidget {
  final Function(int index) pindahHalaman;

  const HomepageSection({Key? key, required this.pindahHalaman}) : super(key: key);

  @override
  State<HomepageSection> createState() => _HomepageSectionState();
}

class _HomepageSectionState extends State<HomepageSection> {
  String getGreeting() {
    var currentTime = DateTime.now();
    var formattedTime = DateFormat.H().format(currentTime);

    if (currentTime.hour >= 5 && currentTime.hour < 11) {
      return 'Selamat Pagi';
    } else if (currentTime.hour >= 11 && currentTime.hour < 15) {
      return 'Selamat Siang';
    } else if (currentTime.hour >= 15 && currentTime.hour < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2), // Warna AppBar
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '👋',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  getGreeting(),
                  style: const TextStyle(
                    color: Color(0xFF636363),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Raleway',
                    height: 0,
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Reski',
                  style: TextStyle(
                    color: Color(
                        0xFF0B0B0B), // Ubah warna sesuai kebutuhan Anda
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway',
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 175,
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF0B0B0B),
                size: 29,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notifikasi');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 1), // Tambahkan jarak atas
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4), // Tambahkan padding horizontal
                child: WidgetHome1(pindahHalaman: widget.pindahHalaman),
              ),
              // LatestArtikel(artikel: artikel)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4), // Tambahkan padding horizontal
                child: Article()
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: 0, // Ganti dengan indeks yang sesuai
        onItemTapped: (index) {
          if (index == 1) {
      Navigator.pushNamed(context, '/artikel');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/pilihandokter');
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
