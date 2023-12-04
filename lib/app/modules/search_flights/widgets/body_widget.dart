import 'package:flight_task_test/app/data/models/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../routes/app_pages.dart';
import 'custom_modal_bottom_sheet.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  int adultCount = 0;
  int childrenCount = 0;
  int infantCount = 0;
  String cabin = 'ECONOMY';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(1, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tabBtn('One Way', true),
              tabBtn('Round Trip', false),
              tabBtn('Multi-City', false),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          doubleTiles(),
          SizedBox(
            height: 5.w,
          ),
          dateTile(),
          SizedBox(
            height: 5.w,
          ),
          flightTile('data'),
          SizedBox(
            height: 5.w,
          ),
          searchBtn(),
        ],
      ),
    );
  }

  Widget tabBtn(String txt, bool isSelected) {
    return Container(
      width: 25.w,
      height: 10.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : Colors.transparent,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Text(
        txt,
        style: isSelected
            ? Theme.of(context).textTheme.headlineSmall
            : Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  Widget doubleTiles() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Column(
          children: [
            Container(
              width: 80.w,
              height: 15.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Bandung BDO',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Container(
              width: 80.w,
              height: 15.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_location_alt_outlined,
                    size: 24.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Going anywhere',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 10.w,
          height: 10.w,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          color: Colors.white,
          child: Icon(
            Icons.construction_sharp,
            color: Colors.blueAccent,
          ),
        )
      ],
    );
  }

  Widget dateTile() {
    return Container(
      width: 80.w,
      height: 15.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => showBarModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => CustomModalBottomSheet(
                onSave: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range_rounded,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  // DateFormat.yMd().format(selectedDate),12/4/2023
                  DateFormat('EEE, d MMM').format(selectedDate),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ' Roundtrip?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                width: 2.w,
              ),
              Switch(value: false, onChanged: (val) {})
            ],
          ),
        ],
      ),
    );
  }

  Widget flightTile(String data) {
    return GestureDetector(
      onTap: () => showBarModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => InfoBottomSheet(
          onSave: (
            adultCt,
            childrenCt,
            infantCt,
            cbn,
          ) {
            setState(() {
              adultCount = adultCt;
              childrenCount = childrenCt;
              infantCount = infantCt;
              cabin = cbn;
            });
            Navigator.pop(context);
          },
        ),
      ),
      child: Container(
        width: 80.w,
        height: 15.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person_2_rounded,
              size: 24.sp,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              '${adultCount + childrenCount + infantCount} Passanger , $cabin',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBtn() {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.SEARCH_RESULT,arguments: RouteArgument(
          param: {
            'date': selectedDate,
            'adults': adultCount,
            'children': childrenCount,
            'infants': infantCount,
            'cabin': cabin,
          }
        ));
      },
      child: Container(
        width: 80.w,
        height: 15.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
        ),
        child: Text(
          'Search Flight',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
