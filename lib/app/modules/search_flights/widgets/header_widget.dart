import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 14.h,
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
      margin: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Martin Odegaard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 3.h,
          ),
        ],
      ),
    );
  }
}
