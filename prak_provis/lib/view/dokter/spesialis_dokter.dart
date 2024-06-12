import 'package:flutter/material.dart';

class SpesialisDokter extends StatefulWidget {
  @override
  _SpesialisDokterState createState() =>
      _SpesialisDokterState();
}

class _SpesialisDokterState extends State<SpesialisDokter> {
  List<String> selectedPoli = [];
  List<String> PilihanPoli = [
    'Gigi',
    'Radiologi',
    'Jantung',
    'Mata',
    'Poliklinik Umum'
    // Tambahkan poli lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Pilihan Topik',
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: PilihanPoli.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: selectedPoli.contains(PilihanPoli[index]),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedPoli.add(PilihanPoli[index]);
                              } else {
                                selectedPoli.remove(PilihanPoli[index]);
                              }
                            }
                          });
                        },
                      ),
                      Text(PilihanPoli[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
