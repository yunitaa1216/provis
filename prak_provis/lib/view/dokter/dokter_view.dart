import 'package:flutter/material.dart';
import 'package:prak_provis/view/dokter/dokter_widget.dart';
import 'package:prak_provis/view/dokter/pilihandokter.dart';
import 'package:prak_provis/model/dokter_model/dokter_model.dart';

// import 'konseling_pilihan_konselor_1.dart';
// import 'konseling_pilihan_konselor_2.dart';

class KonselingSection extends StatelessWidget {
  final int idPaket;
  const KonselingSection({super.key, required this.idPaket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBEDCF2),
        title: Center(
          child: Text(
            "Booking",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DokterWidget(),
            PilihanDokter(idPaket: idPaket)
          ],
        ),
      ),
    );
  }
}
