import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../widgets/general_button_widget.dart';
import 'date_picker_widget.dart';

class CustomModalBottomSheet extends StatefulWidget {
  final Function? onSave;

  const CustomModalBottomSheet({Key? key, this.onSave}) : super(key: key);

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    _controller.displayDate = DateTime.now();
    _controller.selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Text(
            'Set Date Flight',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        middle: const SizedBox(),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 400,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: _getGettingStartedDatePicker(_controller, context),
            ),
            Container(
              height: 6,
              width: 100.w,
              color: Colors.grey.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Departure',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        DateFormat('EEE, d MMM')
                            .format(_controller.selectedDate!),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'want great deals?',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Book Round trip',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GeneralButton(
                onTap: () {
                  widget.onSave!(_controller.selectedDate);
                },
                color: Colors.blueAccent,
                borderColor: Colors.blueAccent,
                text: 'Save',
                textColor: Colors.white,
                width: 85.w,
                height: 13.w,
              ),
            )
          ],
        ),
      ),
    ));
  }

  /// Returns the date range picker based on the properties passed
  Widget _getGettingStartedDatePicker(
      DateRangePickerController controller, BuildContext context) {
    return SfDateRangePicker(
      showNavigationArrow: true,
      controller: controller,
      onSelectionChanged: (_) {
        setState(() {});
      },
    );
  }
}

class InfoBottomSheet extends StatefulWidget {
  final Function? onSave;

  const InfoBottomSheet({super.key, this.onSave});

  @override
  State<InfoBottomSheet> createState() => _InfoBottomSheetState();
}

class _InfoBottomSheetState extends State<InfoBottomSheet> {
  int adultCount = 0;
  int childrenCount = 0;
  int infantCount = 0;
  String cabin = 'ECONOMY';

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Text(
            'Set Passenger & Class',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        middle: const SizedBox(),
      ),
      child: SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          children: [
            adultCountWidget(),
            Container(
              height: 2,
              margin: EdgeInsets.all(8),
              color: Colors.grey.withOpacity(0.2),
            ),
            childCountWidget(),
            Container(
              height: 2,
              margin: EdgeInsets.all(8),
              color: Colors.grey.withOpacity(0.2),
            ),
            infantCountWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cabinBtn('ECONOMY'),
                      SizedBox(
                        height: 2.w,
                      ),
                      cabinBtn(
                        'Business'.toUpperCase(),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cabinBtn('Premium'.toUpperCase()),
                      SizedBox(
                        height: 2.w,
                      ),
                      cabinBtn('First'.toUpperCase()),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GeneralButton(
                onTap: () {
                  widget.onSave!(
                    adultCount,
                    childrenCount,
                    infantCount,
                    cabin,
                  );
                },
                color: Colors.blueAccent,
                borderColor: Colors.blueAccent,
                text: 'Save',
                textColor: Colors.white,
                width: 85.w,
                height: 13.w,
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget cabinBtn(String refTxt) {
    bool isSelected = refTxt == cabin;
    return GestureDetector(
      onTap: () {
        setState(() {
          cabin = refTxt;
        });
      },
      child: Container(
        width: 40.w,
        height: 12.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: isSelected
              ? Colors.blueAccent.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
              width: 1, color: isSelected ? Colors.blueAccent : Colors.grey),
        ),
        child: Text(
          refTxt,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.blueAccent : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget adultCountWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Adult (above 12 years old)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (adultCount > 0) {
                    setState(() {
                      adultCount--;
                    });
                  }
                },
                icon: Image.asset('assets/icons/ic_minus.png'),
              ),
              Text(
                '$adultCount',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    adultCount = adultCount + 1;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.blueAccent,
                  size: 23.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget childCountWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Children (2-11 years old)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (childrenCount > 0) {
                    setState(() {
                      childrenCount--;
                    });
                  }
                },
                icon: Image.asset('assets/icons/ic_minus.png'),
              ),
              Text(
                '$childrenCount',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    childrenCount++;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.blueAccent,
                  size: 23.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget infantCountWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Infant (Below 2 years old)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (infantCount > 0) {
                    setState(() {
                      infantCount--;
                    });
                  }
                },
                icon: Image.asset('assets/icons/ic_minus.png'),
              ),
              Text(
                '$infantCount',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    infantCount++;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Colors.blueAccent,
                  size: 23.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
