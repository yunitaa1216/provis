import 'package:flutter/material.dart';

class PilihanDokter extends StatelessWidget {
  final int idPaket;

  const PilihanDokter({Key? key, required this.idPaket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: konselorList.length,
      itemBuilder: (context, index) {
        final konselor = konselorList[index];
        return CardData(konselor: konselor, idPaket: idPaket);
      },
    );
  }
}

final List<Map<String, dynamic>> konselorList = [
  {
    'name': 'dr. Stenafie Russel',
    'university': 'Spesialis Jantung',
    'profilePicture': 'assets/images/dokterr1.png',
    'tentangdokter': 'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah'
  },
  {
    'name': 'dr. Maryland Winkles',
    'university': 'Spesialis Jantung',
    'profilePicture': 'assets/images/dokterr1.png',
    'tentangdokter': 'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah'
  },
  {
    'name': 'dr. Leatrice Handler',
    'university': 'Spesialis Jantung',
    'profilePicture': 'assets/images/dokterr1.png',
    'tentangdokter': 'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah'
  },
  {
    'name': 'dr. Krishna Barbe',
    'university': 'Spesialis Jantung',
    'profilePicture': 'assets/images/dokterr1.png',
    'tentangdokter': 'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah'
  },
  {
    'name': 'dr. Maryland Winkles',
    'university': 'Spesialis Umum',
    'profilePicture': 'assets/images/dokterr1.png',
    'tentangdokter': 'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah'
  },
];

class CardData extends StatelessWidget {
  final Map<String, dynamic> konselor;
  final int idPaket;

  const CardData({
    Key? key,
    required this.konselor,
    required this.idPaket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/booking',
          arguments: {
            'konselor': konselor,
            'idPaket': idPaket,
          },
        );
      },
      child: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      konselor['profilePicture'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        konselor['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        konselor['university'],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}