import 'package:get/get.dart';

import '../controllers/search_flights_controller.dart';

class SearchFlightsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchFlightsController>(
      () => SearchFlightsController(),
    );
  }
}
