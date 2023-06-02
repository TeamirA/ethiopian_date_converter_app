import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateScrollView extends StatelessWidget {
  const DateScrollView({
    Key? key,
    required this.onChanged,
    required this.dates,
    required this.controller,
    required this.selectedIndex,
    this.isYearScrollView = false,
  }) : super(key: key);

  /// A controller for scroll views whose items have the same size.
  final FixedExtentScrollController controller;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<int> onChanged;

  /// This is a list of dates.
  final List dates;

  /// The currently selected date index.
  final int selectedIndex;

  final bool isYearScrollView;

  double _getScrollViewWidth(BuildContext context) {
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: _getScrollViewWidth(context),
          child: ListWheelScrollView.useDelegate(
            itemExtent: 20,
            controller: controller,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: 1,
            perspective: 0.01,
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildLoopingListDelegate(
              children: List<Widget>.generate(
                dates.length,
                (index) => _buildDateView(index: index),
              ),
            ),
            overAndUnderCenterOpacity: 0.5,
          ),
        );
      },
    );
  }

  Widget _buildDateView({required int index}) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(
        '${dates[index]}',
        style: selectedIndex == index
            ? const TextStyle(fontWeight: FontWeight.bold)
            : null,
      ),
    );
  }
}
