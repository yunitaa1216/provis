import 'package:flutter/material.dart';
import 'package:prak_provis/viewmodel/api_listdokter/list_dokter.dart';
import 'package:provider/provider.dart';
import 'package:prak_provis/model/dokter_model/dokter_model.dart';

class PilihanDokter extends StatelessWidget {
  final int idPaket;

  const PilihanDokter({Key? key, required this.idPaket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoctorProvider()..fetchDoctors(),
      child: Consumer<DoctorProvider>(
        builder: (context, doctorProvider, child) {
          if (doctorProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (doctorProvider.doctors.isEmpty) {
            return Center(child: Text('No doctors found'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: doctorProvider.doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctorProvider.doctors[index];
                return CardData(doctor: doctor, idPaket: idPaket, index: index);
              },
            );
          }
        },
      ),
    );
  }
}

class CardData extends StatelessWidget {
  final Doctor doctor;
  final int idPaket;
  final int index;

  const CardData({
    Key? key,
    required this.doctor,
    required this.idPaket,
    required this.index,
  }) : super(key: key);

  String _getImagePath(int index) {
    // Ganti logika ini sesuai dengan jumlah gambar yang Anda miliki
    List<String> imagePaths = [
      'assets/images/john.png',
      'assets/images/sarah.png',
      'assets/images/alice.png',
      'assets/images/daniel.png',
      'assets/images/emily.png',
      'assets/images/michael.png',
      'assets/images/jane.png',
      'assets/images/robert.png',
      'assets/images/laura.png',
      'assets/images/david.png',
    ];

    return imagePaths[index % imagePaths.length]; // Untuk menghindari out of range
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/booking',
          arguments: {
            'konselor': doctor,
            'idPaket': idPaket,
          },
        );
      },
      child: SizedBox(
        height: 180, // Increase height to accommodate the button
        child: Card(
          elevation: 4, // Add elevation for shadow
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          _getImagePath(index),// You can keep the image path static
                          fit: BoxFit.cover,
                          width: 110,
                          height: 110,
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
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Change text color
                            ),
                          ),
                          Text(
                            doctor.specialization,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Change text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2), // Add spacing between Row and Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/booking',
                        arguments: {
                          'konselor': doctor,
                          'idPaket': idPaket,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C96E9), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Booking',
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
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
