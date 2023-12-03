import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/search_flights_controller.dart';
import '../widgets/background_widget.dart';
import '../widgets/body_widget.dart';
import '../widgets/header_widget.dart';

class SearchFlightsView extends GetView<SearchFlightsController> {
  const SearchFlightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Stack(
        children: [
          const BackgroundWidget(),
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderWidget(),
                      BodyWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
