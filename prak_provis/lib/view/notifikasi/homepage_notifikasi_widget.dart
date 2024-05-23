import 'package:flutter/material.dart';

class NotifikasiList extends StatefulWidget {
  @override
  _NotifikasiListState createState() => _NotifikasiListState();
}

class _NotifikasiListState extends State<NotifikasiList> {
  // Contoh data notifikasi
  List<Map<String, String>> notifikasiData = [
    {'judul': 'Notifikasi 1', 'subjudul': 'Deskripsi notifikasi 1'},
    {'judul': 'Notifikasi 2', 'subjudul': 'Deskripsi notifikasi 2'},
    {'judul': 'Notifikasi 3', 'subjudul': 'Deskripsi notifikasi 3'},
    {'judul': 'Notifikasi 4', 'subjudul': 'Deskripsi notifikasi 4'},
    // Tambahkan data notifikasi lainnya sesuai kebutuhan
  ];

  double dividerThickness = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notifikasiData.length,
            itemBuilder: (context, index) {
              return Container(
                color: const Color.fromARGB(255, 248, 232, 238),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        notifikasiData[index]['judul']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(notifikasiData[index]['subjudul']!),
                      onTap: () {
                        // Implementasikan logika ketika notifikasi diklik
                        // Misalnya, tampilkan detail notifikasi atau lakukan aksi tertentu
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(thickness: dividerThickness),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
