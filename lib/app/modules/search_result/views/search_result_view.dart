import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Obx(() {
        return bodyWidget(context);
      }),
    );
  }

  Widget bodyWidget(BuildContext context) {
    switch (controller.screenState.value) {
      case 0:
        return dataWidget(context);
      case 1:
        return errorWidget(context);
      case 2:
        return emptyWidget(context);
      default:
        return const SizedBox();
    }
  }

  Widget dataWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: headerWidget(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: Text(
              '${controller.flightList.length} Flights',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: controller.flightList.isEmpty
              ? SliverToBoxAdapter(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: const EmptyList(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return flightItemWidget(index, context);
                    },
                    childCount: controller.flightList.length,
                  ),
                ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          sliver: const SliverToBoxAdapter(),
        ),
      ],
    );
  }

  Widget errorWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: headerWidget(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
          sliver: SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_err_flight.png',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.failure!.message.tr,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 30,
              ),
              GeneralButton(
                width: 40.w,
                height: 12.w,
                color: Colors.blueAccent,
                borderColor: Colors.blueAccent,
                textColor: Colors.white,
                text: Strings.tryAgain.tr,
                onTap: () {
                  controller.refreshPage();
                },
              ),
            ],
          )),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          sliver: const SliverToBoxAdapter(),
        ),
      ],
    );
  }

  Widget emptyWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: headerWidget(context),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
          sliver: SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_err_flight.png',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'No FAQs',
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.clip,
              ),
            ],
          )),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          sliver: const SliverToBoxAdapter(),
        ),
      ],
    );
  }

  Widget flightItemWidget(int index, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            firstRowWidget(index, context),
            const SizedBox(
              height: 8,
            ),
            secondRowWidget(index,context),
            const SizedBox(
              height: 8,
            ),
            thirdRowWidget(index,context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
            ),
            forthRowWidget(index,context),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      width: 100.w,
      height: 25.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.deepPurpleAccent.withOpacity(0.2),
            Colors.grey.shade200,
          ])),
      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'RUH',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: Text(
                  '-----------------🛩️----------------',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'BOM',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.selectedDate,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${controller.adultCount + controller.childrenCount + controller.infantCount} Passengers',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                controller.cabin,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget firstRowWidget(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          controller.getMDfromDateStr(controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .departure!
              .at!),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          controller.getMDfromDateStr(controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .arrival!
              .at!),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }

  Widget secondRowWidget(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .departure!
              .iataCode!,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Expanded(
          child: Text(
            '-----------------🛩️----------------',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .arrival!
              .iataCode!,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }

  Widget thirdRowWidget(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          controller.getTimeFromDateStr(controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .departure!
              .at!),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          controller.getTimeFromDateStr(controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .arrival!
              .at!),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
  Widget forthRowWidget(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          controller.getNumStops(controller.flightList
              .elementAt(index)
              .itineraries!
              .first
              .segments!
              .first
              .numberOfStops!),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          '\$${controller.flightList
              .elementAt(index)
              .price!.base!}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
