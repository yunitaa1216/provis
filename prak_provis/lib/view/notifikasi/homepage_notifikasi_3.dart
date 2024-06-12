import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prak_provis/model/utils/auth_service.dart';

import '../widgets/bottom_navigation_bar.dart';
// import 'package:women_center_mobile/View/widgets/bottom_navigation_bar.dart';

class HomepageNotifikasi3 extends StatefulWidget {
  @override
  _HomepageNotifikasi3State createState() => _HomepageNotifikasi3State();
}

class _HomepageNotifikasi3State extends State<HomepageNotifikasi3> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        toolbarHeight: 96,
        title: Center(
          child: Transform.translate(
            offset: Offset(0.0, 10.0), // Adjust the value to move the text down
            child: Text(
              'Notifikasi',
              style: GoogleFonts.roboto(
                // Use the Google Fonts class
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _dateHeader('9 Juni 2024'),
          _coloredCard(
            _itemNotifikasi('${AuthService.email}', 'ini adalah pengingat untuk janji temu medis Anda besok pukul 09:00. Harap pastikan Anda hadir tepat waktu. Terima kasih.'),
            Color(0xFFD8F0FA),
          ),
          _dateHeader('8 Juni 2024'),
          _coloredCard(
            _itemNotifikasi('${AuthService.email}', 'ingat untuk minum obat Anda hari ini. Waktu minum obat adalah pukul 08:00. Jangan lupa untuk meminumnya sesuai petunjuk dokter.'),
            Color(0xFFD8F0FA),
          ),
          _dateHeader('7 Juni 2024'),
          _coloredCard(
            _itemNotifikasi('${AuthService.email}', 'ingat untuk minum obat Anda hari ini. Waktu minum obat adalah pukul 08:00. Jangan lupa untuk meminumnya sesuai petunjuk dokter.'),
            Color(0xFFD8F0FA),
          ),
          _dateHeader('6 Juni 2024'),
          _coloredCard(
            _itemNotifikasi('${AuthService.email}', 'ingat untuk minum obat Anda hari ini. Waktu minum obat adalah pukul 08:00. Jangan lupa untuk meminumnya sesuai petunjuk dokter.'),
            Color(0xFFD8F0FA),
          ),
          _dateHeader('5 Juni 2024'),
          _coloredCard(
            _itemNotifikasi('${AuthService.email}', 'ingat untuk minum obat Anda hari ini. Waktu minum obat adalah pukul 08:00. Jangan lupa untuk meminumnya sesuai petunjuk dokter.'),
            Color(0xFFD8F0FA),
          ),
        ],
      ),
      // bottomNavigationBar: MyBottomNavigationBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //       // if (_selectedIndex == 0) {
      //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      //       // } else if (_selectedIndex == 1) {
      //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => ArtikelScreen()));
      //       // }
      //     });
      //   },
      // ),
    );
  }

  Widget _dateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        date,
        style: GoogleFonts.roboto(
          // Use the Google Fonts class
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF646464),
        ),
      ),
    );
  }

  Widget _itemNotifikasi(String nama, String keterangan) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: GoogleFonts.roboto(
              // Use the Google Fonts class
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF646464),
            ),
          ),
          Text(
            keterangan,
            style: GoogleFonts.roboto(
              // Use the Google Fonts class
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF646464),
            ),
          ),
          Divider(
            color: Color(0xFF646464),
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

  Widget _coloredCard(Widget child, Color color) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: child,
    );
  }
}
