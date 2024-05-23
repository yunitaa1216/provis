import 'package:flutter/material.dart';
import 'package:prak_provis/view/pembayaran/pembayaran.dart';
// import 'package:women_center_mobile/View/metode_pembayaran/1.dart';

class PemesananSukses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Booking',
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        backgroundColor: const Color(0xFFBEDCF2),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context,'/homepage' );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageContainerpembayaran(),
            const SizedBox(
              height: 35,
            ),
            InfoSukses()
          ],
        ),
      ),
    );
  }
}

class ImageContainerpembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              width: 136,
              height: 136,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Ubah sesuai kebutuhan
                image: const DecorationImage(
                  image: AssetImage(
                      'Assets/images/centang_ijo.png'), // Ganti dengan URL gambar Anda
                  fit: BoxFit.cover, // Sesuaikan dengan kebutuhan
                ),
              ),
            ),
          ),
          const SizedBox(height: 27),
          const Text(
            '''Booking Berhasil''',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            width: 300,
            child: const Text(
              'Datanglah tepat waktu sesuai dengan jadwal anda. Pastikan Anda mengaktifkan tombol notifikasi agar Anda selalu mendapatkan pembaruan terbaru dari kami!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4B4B4B),
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSukses extends StatefulWidget {
  @override
  _InfoSuksesState createState() => _InfoSuksesState();
}

class _InfoSuksesState extends State<InfoSukses> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 410,
          height: 400,
          // padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 12,
                offset: Offset(0, -4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 375,
                      padding: const EdgeInsets.only(top: 32),
                      child: const Row(
                        children: [
                          Text(
                            'Detail Booking',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 14,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              TeksInConatiner(),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                 onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MetodePembayaran1(),
                            ));
                      },
                child:
              Container(
                width: 329,
                height: 42,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: ShapeDecoration(
                  color: Color(0xFF3C96E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: []),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Lakukan Pembayaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TeksInConatiner extends StatefulWidget {
  @override
  _TeksInConatinerState createState() => _TeksInConatinerState();
}

class _TeksInConatinerState extends State<TeksInConatiner> {
  final List<String> firstList = [
    'No Antrian',
    'Waktu',
    'Tanggal',
    'Dokter',
    'ID tranksaksi'
  ];
  final List<String> secondList = [
    '50',
    '09:00 WIB',
    '10 Oktober 2023',
    'dr. Stefanie',
    '90124h12u412424'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: firstList.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Color(0xFF636363),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              // alignment: AlignmentDirectional.topEnd,
              alignment: FractionalOffset.centerRight,
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: secondList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  Color textColor = Colors.black;
                  if (index == 1) {
                    textColor = Colors.black;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
