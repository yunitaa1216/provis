// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../model/utils/navigation_service.dart';

// class BookingDokter extends StatefulWidget {
//   final String description;
//   final List<int> schedule;
//   final int konselorId;
//   final int paketId;

//   const BookingDokter({
//     super.key,
//     required this.description,
//     required this.schedule,
//     required this.konselorId,
//     required this.paketId,
//   });

//   @override
//   State<BookingDokter> createState() => _BookingDokterState();
// }

// class _BookingDokterState extends State<BookingDokter> {


//   final List<DateTime?> _listTanggal = [null, null, null];

//   void updateTanggal(int index, DateTime tgl) {
//     _listTanggal[index] = tgl;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          const Text(
//              "dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah."),
//         Text(widget.description),
//         const Text("Topik Keahlian"),
//         SizedBox(
//           height: 30,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             //itemCount: _listKeahlian.length,
//             itemBuilder: (context, index) {
//               //return TopikKeahlianItem(keahlian: _listKeahlian[index]);
//             },
//           ),
//         ),
//         const Text("Atur Jadwal"),
//         MingguItem(
//           index: 0,
//           onChange: updateTanggal,
//           schedule: widget.schedule,
//         ),
//         MaterialButton(
//           minWidth: double.infinity,
//           onPressed: () async {
//             // TODO: post ke api
//             // final response = await context.read<KonselorViewModel>().booking(
//             //       widget.konselorId,
//             //       widget.paketId,
//             //       _listTanggal,
//             //     );

//             // if (response) {
//             //   final orderIdviewModel = context.read<KonselorViewModel>().order_id;
//             //   log("di view model: $orderIdviewModel");
              
//             //   final prefs = await SharedPreferences.getInstance();
//             //   final orderIdLocalStorage = prefs.getString("order_id");
//             //   log("di localstorage: $orderIdLocalStorage");
              
//               Navigator.pushNamed(
//                 NavigationService.navigatorKey.currentContext ?? context,
//                 "/pembayaran1",
//               );
//           },
//           color: Color(0xFFBEDCF2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//           ),
//           textColor: Colors.white,
//           child: Text("Booking"),
//         ),
//       ],
//     );
//   }
// }

// class MingguItem extends StatefulWidget {
//   final int index;
//   final List<int> schedule;
//   final Function(int index, DateTime tgl) onChange;

//   const MingguItem({
//     super.key,
//     required this.index,
//     required this.onChange,
//     required this.schedule,
//   });

//   @override
//   State<MingguItem> createState() => _MingguItemState();
// }

// class _MingguItemState extends State<MingguItem> {
//   final _tglController = TextEditingController();

//   void pilihTanggal() async {
//     final tgl = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month),
//     );

//     log(tgl?.weekday.toString() ?? "");
//     log(widget.schedule.toString());
//     log(widget.schedule.contains(tgl?.weekday).toString());

//     if (tgl != null && widget.schedule.contains(tgl.weekday)) {
//       setState(() {
//         _tglController.text = DateFormat("EEEE, d MMMM yyyy").format(tgl);
//       });
//       widget.onChange(widget.index, tgl);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         const Text("Tanggal"),
//         TextField(
//           readOnly: true,
//           onTap: pilihTanggal,
//           controller: _tglController,
//           style: TextStyle(fontSize: 14),
//           decoration: InputDecoration(
//             suffixIcon: const Icon(Icons.date_range),
//             suffixIconColor: Color(0xFFBEDCF2),
//             fillColor: Colors.white,
//             filled: true,
//             isDense: true,
//             hintText: "Pilih tanggal",
//             enabledBorder: borderSaya(),
//             focusedBorder: borderSaya(),
//           ),
//         ),
//         const Text("Jam"),
//         const PilihJam(),
//       ],
//     );
//   }

//   InputBorder borderSaya() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide.none,
//     );
//   }
// }

// class PilihJam extends StatefulWidget {
//   const PilihJam({super.key});

//   @override
//   State<PilihJam> createState() => _PilihJamState();
// }

// class _PilihJamState extends State<PilihJam> {
//   final List<String> _listJam = [
//     "09.00",
//     "11.00",
//     "13.00",
//     "15.00",
//     "17.00",
//   ];
//   String _selectedJam = "09.00";

//   void changeJam(String jam) {
//     setState(() => _selectedJam = jam);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         JamItem(
//           value: _listJam[0],
//           groupValue: _selectedJam,
//           onChanged: changeJam,
//         ),
//         JamItem(
//           value: _listJam[1],
//           groupValue: _selectedJam,
//           onChanged: changeJam,
//         ),
//         JamItem(
//           value: _listJam[2],
//           groupValue: _selectedJam,
//           onChanged: changeJam,
//         ),
//         JamItem(
//           value: _listJam[3],
//           groupValue: _selectedJam,
//           onChanged: changeJam,
//         ),
//         JamItem(
//           value: _listJam[4],
//           groupValue: _selectedJam,
//           onChanged: changeJam,
//           enabled: false,
//         ),
//       ],
//     );
//   }
// }

// class JamItem extends StatelessWidget {
//   final String value;
//   final String groupValue;
//   final Function(String value) onChanged;
//   final bool enabled;

//   const JamItem({
//     super.key,
//     required this.value,
//     required this.groupValue,
//     this.enabled = true,
//     required this.onChanged,
//   });

//   bool get _selected => value == groupValue;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30,
//       width: 60,
//       child: MaterialButton(
//         onPressed: enabled
//             ? () {
//                 onChanged(value);
//               }
//             : null,
//         elevation: 0,
//         highlightElevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         color: _selected ? Color(0xFFBEDCF2) : Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//           side: _selected || !enabled
//               ? BorderSide.none
//               : const BorderSide(color: Color(0xFFC9C9C9)),
//         ),
//         disabledColor: const Color(0xFFDFDFDF),
//         textColor: _selected ? Colors.white : Colors.black,
//         disabledTextColor: const Color(0xFF646464),
//         child: Text(value),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';

// class BookingForm extends StatefulWidget {
//   @override
//   _BookingFormState createState() => _BookingFormState();
// }

// class _BookingFormState extends State<BookingForm> {
//   DateTime _selectedDate = DateTime.now();
//   String _selectedTime = '';

//   List<String> _timeSlots = ['09.00', '11.00', '13.00', '15.00', '17.00'];

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//       locale: const Locale('id', 'ID'),
//     );
//     if (picked != null && picked != _selectedDate)
//       setState(() {
//         _selectedDate = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             color: Colors.grey[300],
//             padding: EdgeInsets.only(top: 10),
//             child: Center(
//               child: Image.asset(
//                 'assets/images/dokter1.png',
//                 width: 300,
//                 height: 350,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Colors.grey[100],
//               padding: EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         'dr. Stenafie Russel',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Center(
//                       child: Text(
//                         'Spesialis Jantung dan Pembuluh Darah',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     Center(
//                     child: Text(
//                       'Tentang Dokter',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     ),
//                     SizedBox(height: 4,),
//                     Center(
//                       child: Container(
//                         width: 150,
//                         height: 1,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'dr. Stefanie Russel merupakan seorang dokter lulusan Universitas Indonesia yang memiliki keahlian khusus dalam mendiagnosis dan menangani berbagai penyakit yang berkaitan dengan jantung dan pembuluh darah.',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontFamily: 'Raleway',
//                         color: Colors.grey[600],
//                       ),
//                       textAlign: TextAlign.justify
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Atur Jadwal',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Text(
//                       'Tanggal',
//                       style: TextStyle(
//                         fontSize: 24,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Container(
//                       color: Colors.white,
//                       child: Row(
//                         children: [
//                           Text(
//                             //DateFormat.ABBR_MONTH,
//                             DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(_selectedDate),
//                             //'${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(width: 200),
//                           IconButton(
//                             onPressed: () => _selectDate(context),
//                             icon: Icon(Icons.date_range),
//                             color: Colors.blue,
//                             padding: EdgeInsets.zero,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Jam:',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Wrap(
//                       spacing: 8,
//                       children: _timeSlots.map((time) {
//                         return ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               _selectedTime = time;
//                             });
//                           },
//                           child: Text(time),
//                           style: ElevatedButton.styleFrom(
//                             primary: _selectedTime == time
//                                 ? Colors.blue
//                                 : Colors.white,
//                             onPrimary: _selectedTime == time
//                                 ? Colors.white
//                                 : Colors.black,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               side: BorderSide(
//                                 color: _selectedTime == time
//                                     ? Colors.transparent
//                                     : Color(0xFFC9C9C9),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 24),
//                     Center(
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/pemesanansukses');
//                         },
//                         color: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                         textColor: Colors.white,
//                         child: Text('Pesan'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  late Map<String, dynamic> _konselor;
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '';

  List<String> _timeSlots = ['09.00', '11.00', '13.00', '15.00', '17.00'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _konselor = args['konselor'];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color.fromARGB(255, 218, 216, 216),
            // padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Image.asset(
                _konselor['profilePicture'],
                width: 350,
                height: 380,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.white,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        _konselor['name'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        _konselor['university'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Tentang Dokter',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Center(
                      child: Container(
                        width: 150,
                        height: 1,
                        color: Color(0xFF3C96E9),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _konselor['tentangdokter'],
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Atur Jadwal',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Tanggal',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(_selectedDate),
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () => _selectDate(context),
                            icon: Icon(Icons.date_range),
                            color: Color(0xFF3C96E9),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Jam:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: _timeSlots.map((time) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedTime = time;
                            });
                          },
                          child: Text(time),
                          style: ElevatedButton.styleFrom(
                            primary: _selectedTime == time
                                ? Color(0xFF3C96E9)
                                : Colors.white,
                            onPrimary: _selectedTime == time
                                ? Colors.white
                                : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: _selectedTime == time
                                    ? Colors.transparent
                                    : Color(0xFFC9C9C9),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          Navigator.pushNamed(context, '/pemesanansukses');
                        },
                        color: Color(0xFF3C96E9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        textColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Pesan',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

