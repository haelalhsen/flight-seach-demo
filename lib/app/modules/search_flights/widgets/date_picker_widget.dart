///Package import
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    _controller.displayDate = DateTime.now();
    _controller.selectedDate = DateTime.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Returns the date range picker based on the properties passed
  Widget _getGettingStartedDatePicker(
      DateRangePickerController controller, BuildContext context) {
    return SfDateRangePicker(
      showNavigationArrow: true,
      controller: controller,
    );
  }
  @override
  Widget build(BuildContext context) {
    final Widget cardView = Container(
      height: 450,
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: _getGettingStartedDatePicker(_controller, context),
    );
    return SizedBox(
      height: 450,
      child: cardView,
    );
  }

}
