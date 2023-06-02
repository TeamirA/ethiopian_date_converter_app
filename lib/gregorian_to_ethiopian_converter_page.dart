import 'package:abushakir/abushakir.dart';
import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class GregorianToEthiopianConverterPage extends StatefulWidget {
  const GregorianToEthiopianConverterPage({super.key});

  @override
  State<GregorianToEthiopianConverterPage> createState() =>
      _GregorianToEthiopianConverterPageState();
}

class _GregorianToEthiopianConverterPageState
    extends State<GregorianToEthiopianConverterPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.teal[50],
      ),
      backgroundColor: Colors.teal[50],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ethiopian to Gregorian Calendar Converter',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const Divider(
              endIndent: 100,
              indent: 100,
              color: Colors.teal,
              height: 75,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              child: ScrollDatePicker(
                options: DatePickerOptions(
                  backgroundColor: Colors.teal[50]!,
                ),
                selectedDate: _selectedDate,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
                maximumDate:
                    DateTime.now().add(const Duration(days: 365 * 100)),
              ),
            ),
            const Divider(
              endIndent: 100,
              indent: 100,
              color: Colors.teal,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              getDate(),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }

  String getDate() {
    final etDate = EtDatetime.fromMillisecondsSinceEpoch(
        _selectedDate.millisecondsSinceEpoch);
    final weekDays = [
      'ሰኞ',
      'ማክሰኞ',
      'ረቡዕ',
      'ሐሙስ',
      'አርብ',
      'ቅዳሜ',
      'እሁድ',
    ];
    return '${weekDays[_selectedDate.weekday - 1]} ${etDate.monthGeez} ${etDate.day}, ${etDate.year}';
  }
}
