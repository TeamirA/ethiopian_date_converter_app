import 'package:abushakir/abushakir.dart';
import 'package:ethiopian_date_converter/date_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EthiopianToGregorianConverterPage extends StatefulWidget {
  const EthiopianToGregorianConverterPage({super.key});

  @override
  State<EthiopianToGregorianConverterPage> createState() => _EthiopianToGregorianConverterPageState();
}

class _EthiopianToGregorianConverterPageState extends State<EthiopianToGregorianConverterPage> {
  int selectedMonthIndex = 0;
  int selectedYearIndex = 0;
  int selectedDayIndex = 0;

  late FixedExtentScrollController yearController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController dayController;

  late List<int> days;
  late List<String> months;
  late List<int> years;

  @override
  void initState() {
    super.initState();
    yearController =
        FixedExtentScrollController(initialItem: selectedYearIndex);
    monthController =
        FixedExtentScrollController(initialItem: selectedMonthIndex);
    dayController = FixedExtentScrollController(initialItem: selectedDayIndex);

    days = [for (var i = 1; i <= 30; i++) i];
    months = const [
      'መስከረም',
      'ጥቅምት',
      'ኅዳር',
      'ታህሳስ',
      'ጥር',
      'የካቲት',
      'መጋቢት',
      'ሚያዝያ',
      'ግንቦት',
      'ሰኔ',
      'ሐምሌ',
      'ነሐሴ',
      // 'ጳጉሜን'
    ];
    years = [for (var i = 1900; i <= 2100; i++) i];
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
            Divider(
              endIndent: 100,
              indent: 100,
              color: Colors.teal,
              height: 75,
            ),
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DateScrollView(
                    onChanged: (value) {
                      setState(() {
                        selectedDayIndex = value;
                      });
                    },
                    dates: days,
                    controller: dayController,
                    selectedIndex: selectedDayIndex,
                  ),
                  DateScrollView(
                    onChanged: (value) {
                      setState(() {
                        selectedMonthIndex = value;
                      });
                    },
                    dates: months,
                    controller: monthController,
                    selectedIndex: selectedMonthIndex,
                  ),
                  DateScrollView(
                    onChanged: (value) {
                      setState(() {
                        selectedYearIndex = value;
                      });
                    },
                    dates: years,
                    controller: yearController,
                    selectedIndex: selectedYearIndex,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 100,
              indent: 100,
              color: Colors.teal,
            ),
            SizedBox(
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
    final etDate = EtDatetime(
      year: years[selectedYearIndex],
      month: selectedMonthIndex + 1,
      day: selectedDayIndex + 1,
    );
    final gregorianDate = DateTime.fromMillisecondsSinceEpoch(etDate.moment);
    final dateFormatter = DateFormat('EEEE MMMM dd, yyyy');
    return dateFormatter.format(gregorianDate);
  }
}
