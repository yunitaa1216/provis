import 'package:flutter/material.dart';
// import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:intl/date_symbol_data_local.dart';
import 'package:prak_provis/view/booking/pesanjadwal.dart';
import 'package:prak_provis/view/dokter/dokter_view.dart';
import 'package:prak_provis/view/dokter/pilihandokter.dart';

import '../kalender/kalender.dart';
import '../profile/chatbot.dart';
// import 'package:women_center_mobile/View/artikel/buat_artikel.dart';
// import 'package:women_center_mobile/View/chatbot/chatbot_cs_view.dart';
// import 'package:women_center_mobile/View/kalender/kalender.dart';
// import 'package:women_center_mobile/View/sesi_konseling/sesi_konseling.dart'; // Import library untuk lokal

class WidgetHome1 extends StatefulWidget {
  final Function(int index) pindahHalaman;
  const WidgetHome1({Key? key, required this.pindahHalaman}) : super(key: key);

  @override
  State<WidgetHome1> createState() => _WidgetHome1State();
}

class _WidgetHome1State extends State<WidgetHome1> {
  @override
  Widget build(BuildContext context) {
    ///method hari,tanngal dan bulan saat ini
    initializeDateFormatting(
        'id_ID', null); // Inisialisasi lokal bahasa Indonesia

    String getCurrentDay() {
      var format = DateFormat(
          'EEEE', 'id_ID'); // Menggunakan lokal bahasa Indonesia (id_ID)
      return format.format(DateTime.now());
    }

    String getCurrentDate() {
      var format = DateFormat('d', 'id_ID');
      return format.format(DateTime.now());
    }

    String getCurrentMonth() {
      var format = DateFormat('MMMM', 'id_ID');
      return format.format(DateTime.now());
    }

    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          width: 395,
          height: 145,
          // padding: const EdgeInsets.only(left: 6, right: 6, bottom: 19),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            // shadows: const [
            //   BoxShadow(
            //     color: Color(0x19212121),
            //     blurRadius: 24,
            //     offset: Offset(0, 4),
            //     spreadRadius: 0,
            //   )
            // ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  // AnimatedSlideColumn()
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KalenderEvent(),
                            ));
                      },
                      
                      child: Container(
                        width: 74,
                        height: 106,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          color: Color(0xFF27BADB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentDay(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentDate(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentMonth(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0.18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          widget.pindahHalaman(3);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 250,
                                height: 52,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFD8F0FA),
                                      Color(0xFFFFFFFF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 17),
                                      child: Text(
                                        'Temukan kesehatanmu',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 55, top: 15),
                                      child: Text(
                                        'Booking rawat jalan',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              left: 194,
                              top: 16,
                              child: GestureDetector(
                              onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KonselingSection(idPaket: 1)
                              ));
                        },
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF89D8EB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0xFF89D8EB),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Icon(
                Icons.note_alt, // Ganti dengan ikon yang Anda inginkan
                color: Colors.black, // Sesuaikan warna ikon
                size: 34, // Sesuaikan ukuran ikon
              ),
            ),
                                  ],
                                ),
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFD8F0FA),
                                      Color(0xFFFFFFFF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 63, top: 15),
                                      child: Text(
                                        'Bingung soal booking?',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1, top: 18, right: 32),
                                      child: Text(
                                        'PULIH AI',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              top: -3,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF89D8EB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: const Color(0xFF89D8EB),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Icon(
                Icons.chat_outlined, // Ganti dengan ikon yang Anda inginkan
                color: Colors.black, // Sesuaikan warna ikon
                size: 34, // Sesuaikan ukuran ikon
              ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: const Center(
        child: Text(
          'Halaman Baru',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class WidgetHomeKonselor extends StatefulWidget {
  const WidgetHomeKonselor({Key? key}) : super(key: key);

  @override
  State<WidgetHomeKonselor> createState() => _WidgetHomeKonselorState();
}

class _WidgetHomeKonselorState extends State<WidgetHomeKonselor> {
  @override
  Widget build(BuildContext context) {
    ///method hari,tanngal dan bulan saat ini
    initializeDateFormatting(
        'id_ID', null); // Inisialisasi lokal bahasa Indonesia

    String getCurrentDay() {
      var format = DateFormat(
          'EEEE', 'id_ID'); // Menggunakan lokal bahasa Indonesia (id_ID)
      return format.format(DateTime.now());
    }

    String getCurrentDate() {
      var format = DateFormat('d', 'id_ID');
      return format.format(DateTime.now());
    }

    String getCurrentMonth() {
      var format = DateFormat('MMMM', 'id_ID');
      return format.format(DateTime.now());
    }

    return Column(
      children: [
        const SizedBox(height: 40),
        Container(
          width: 360,
          height: 145,
          // padding: const EdgeInsets.only(left: 6, right: 6, bottom: 19),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color(0xFFF8E8EE),
            shadows: const [
              BoxShadow(
                color: Color(0x19212121),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  // AnimatedSlideColumn()
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/kalender');
                      },
                      child: Container(
                        width: 74,
                        height: 106,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0, 7),
                            colors: [
                              Color(0xFFF2F2F2),
                              Color(0xFF9747FF),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19212121),
                              blurRadius: 24,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentDay(),
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentDate(),
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 40,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text(
                                      getCurrentMonth(),
                                      style: TextStyle(
                                        color: Color(0xFFF4518D),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                        height: 0.18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => buat_artikel(),
                          //     ));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(top: 19),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, top: 17),
                                      child: Text(
                                        'Buat Artikel Untuk User',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 124, top: 22),
                                      child: Text(
                                        'Artikel',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              left: 194,
                              top: 16,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/note_alt.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman baru ketika kontainer 1 ditekan
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SesiKonseling(),
                          //     ));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Container 1
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -16),
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF9747FF),
                                      Color(0xFFFDCEDF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 28, top: 15),
                                      child: Text(
                                        'Cek sesi dengan user',
                                        style: TextStyle(
                                          color: Color(0xFF1F1F1F),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 22, right: 47),
                                      child: Text(
                                        'Konseling',
                                        style: TextStyle(
                                          color: Color(0xFF4B4B4B),
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container 2 (hijau)
                            Positioned(
                              top: -3,
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8E8EE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x19212121),
                                      blurRadius: 24,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Image.asset(
                                        'Assets/images/mdi_work.png', // Ganti dengan path gambar Anda
                                        width: 24, // Sesuaikan ukuran gambar
                                        height: 24, // Sesuaikan ukuran gambar
                                        fit: BoxFit
                                            .cover, // Atur jenis tampilan gambar
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
