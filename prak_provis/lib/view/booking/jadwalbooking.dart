// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:prak_provis/view/booking/pesanjadwal.dart';
// import 'package:provider/provider.dart';

// import '../../model/konselor_model/konselor_model.dart';

// class BookingArgs {
//   final KonselorModel dokter;
//   final int idPaket;

//   BookingArgs(konselor, {
//     required this.dokter,
//     required this.idPaket,
//   });
// }

// class Booking extends StatefulWidget {
//   const Booking({super.key});

//   @override
//   State<Booking> createState() => _BookingState();
// }

// class _BookingState extends State<Booking> {
//   late BookingArgs _args;
//   List<int> _schedule = [];

//   @override
//   Widget build(BuildContext context) {
//     // final args = ModalRoute.of(context)?.settings.arguments as BookingArgs?;
//     // fetchSchedule();

//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.network(
//             _args.dokter.profilePicture,
//             width: double.infinity,
//             fit: BoxFit.contain,
//           ),
//           SingleChildScrollView(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF9F5F6),
//                 borderRadius: BorderRadius.circular(32),
//               ),
//               padding: const EdgeInsets.only(
//                   top: 32, bottom: 10, left: 16, right: 16),
//               margin: const EdgeInsets.only(top: 433),
//               child: Column(
//                 children: [
//                   Text(_args.dokter.firstName + _args.dokter.lastName),
//                   Text(_args.dokter.education),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'Assets/images/ig_icon.png',
//                         width: 20,
//                       ),
//                       const Text("@stefaniersl"),
//                     ],
//                   ),
//                   PsikologTabView(
//                     description: _args.dokter.description,
//                     schedule: _schedule,
//                     konselorId: _args.dokter.id,
//                     paketId: _args.idPaket,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PsikologTabView extends StatefulWidget {
//   final String description;
//   final List<int> schedule;
//   final int konselorId;
//   final int paketId;

//   const PsikologTabView({
//     super.key,
//     required this.description,
//     required this.schedule, required this.konselorId, required this.paketId,
//   });

//   @override
//   State<PsikologTabView> createState() => _PsikologTabViewState();
// }

// class _PsikologTabViewState extends State<PsikologTabView> {
//   final List<Tab> _tabs = [
//     const Tab(
//       child: Text("Tentang Psikolog"),
//     ),
//     const Tab(
//       child: Text("Review"),
//     ),
//   ];
//   List<Widget> get _views => [
//         BookingDokter(
//           description: widget.description,
//           schedule: widget.schedule,
//           konselorId: widget.konselorId,
//           paketId: widget.paketId,
//         ),
//         // const Review(),
//       ];

//   int _selectedIndex = 0;

//   void changeViews(index) {
//     setState(() => _selectedIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DefaultTabController(
//           length: _tabs.length,
//           child: TabBar(
//             tabs: _tabs,
//             onTap: changeViews,
//           ),
//         ),
//         _views[_selectedIndex],
//       ],
//     );
//   }
// }
