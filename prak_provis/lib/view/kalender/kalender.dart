import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../model/kalender_model/kalender_model.dart';
import 'dart:core';

class KalenderEvent extends StatefulWidget {
  @override
  _KalenderEventState createState() => _KalenderEventState();
}

class _KalenderEventState extends State<KalenderEvent> {
  List<DateTime> selectedDates = [];
  bool isEditing = false;
  List<Event> events = [];
  List<DateTime> dummyEvents = [];

  @override
void initState() {
  super.initState();
  
  // Tetapkan tanggal event menjadi tanggal 19 April
  DateTime eventDate = DateTime(DateTime.now().year, 4, 19);
  
  // Tambahkan data dummy ke dalam events
  events.add(
    Event(
      id: 1,
      date: 'eventDate',
      title: 'Konsultasi Penyakit Jantung',
      timeStart: '09:00', // Tetapkan nilai timeStart sebagai String
      nama_dokter: 'dr. Zainal Azhar'
    ),
  );
  
  // Tambahkan tanggal dummy ke dalam dummyEvents
  dummyEvents.add(eventDate);
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFBEDCF2),
          title: Text(
            'Kalender',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF0F4FB),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (!isEditing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        dummyEvents.isNotEmpty
                            ? DateFormat('EEE, MMM d').format(dummyEvents[0])
                            : "",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w400),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
              if (!isEditing) Divider(),
              SizedBox(height: 16),
              if (isEditing)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  isEditing = false;
                                });
                              },
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('Save',
                              style: TextStyle(color: Color(0xFFf4518d))),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Text(
                            'Depart - Return Dates',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 55),
                          child: Text(
                            dummyEvents.isNotEmpty
                                ? DateFormat('EEE, MMM d')
                                    .format(dummyEvents[0])
                                : "",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w400),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('Edit Button Pressed');
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    )
                  ],
                ),
                Align(
                alignment: Alignment.topLeft,
                child: isEditing
                    ? CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          selectedDayHighlightColor: Color(0xFF3C96E9),
                        ),
                        value: dummyEvents,
                      )
                    : CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                          selectedDayHighlightColor: Color(0xFF3C96E9),
                        ),
                        value: dummyEvents,
                      ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!isEditing)
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15,
                          top: 0,
                          bottom:
                              0), // Sesuaikan nilai top dan bottom sesuai kebutuhan
                      child: Text(
                        'Acara',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
              if (!isEditing)
  Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          Event currentEvent = events[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      currentEvent.timeStart,
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(width: 15),
                    Text(
                      currentEvent.title,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    // Text(
                    //   currentEvent.timeFinish,
                    //   style: TextStyle(fontSize: 13),
                    // ),
                    SizedBox(width: 45),
                    Text(
                      currentEvent.nama_dokter,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFBEDCF2),
                height: 0,
              ),
            ],
          );
        },
      ),
    ),
  )
                ]
                ),
        ),
    );
  }
}
                