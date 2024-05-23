import 'package:flutter/material.dart';

import 'homepage_notifikasi_widget.dart';
// import 'package:women_center_mobile/View/homepage/notifikasi/homepage_notifikasi_widget.dart';
// import 'package:women_center_mobile/View/homepage/notifikasi/notifikasi_list_tap.dart';

class HomepageNotifikasi extends StatelessWidget {
  const HomepageNotifikasi({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // const Expanded(
          //   flex: 2,
          //   child: NotifikasiListTap(),
          // ),
          Expanded(
            flex: 5,
            child: NotifikasiList(),
          ),
        ],
      ),
    );
  }
}
