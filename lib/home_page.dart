import 'package:ethiopian_date_converter/ethiopian_to_gregorian_converter_page.dart';
import 'package:ethiopian_date_converter/gregorian_to_ethiopian_converter_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Date Converter',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Divider(
            endIndent: 100,
            indent: 100,
            color: Colors.teal,
            height: 75,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const EthiopianToGregorianConverterPage(),
                  ),
                );
              },
              child: const Text('Ethiopian to Gregorian')),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const GregorianToEthiopianConverterPage(),
                  ),
                );
              },
              child: const Text('Gregorian to Ethiopian')),
        ],
      ),
    );
  }
}
