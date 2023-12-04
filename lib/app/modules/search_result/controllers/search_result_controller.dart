import 'package:flight_task_test/app/data/models/flight_model.dart';
import 'package:flight_task_test/app/data/repositories/main_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/failures.dart';
import '../../../data/models/route_argument.dart';

class SearchResultController extends GetxController {
  RouteArgument? routeArgument;
  GlobalKey<ScaffoldState>? scaffoldKey;
  late MainDataRepository mainDataRepository;

  var flightList = <Flight>[].obs;

  /// loading: 0 , errorResponse: 1, emptyResponse =2
  var screenState = 0.obs;
  Failure? failure;

  int adultCount = 0;
  int childrenCount = 0;
  int infantCount = 0;
  String cabin = 'Economy';
  String selectedDate = '';

  @override
  void onInit() {
    if (Get.arguments != null) {
      routeArgument = Get.arguments;
      selectedDate = DateFormat('yyyy-MM-dd').format(routeArgument!.param['date']);
      cabin = routeArgument!.param['cabin'];
      childrenCount = routeArgument!.param['children'];
      infantCount = routeArgument!.param['infants'];
      adultCount = routeArgument!.param['adults'];
    }
    mainDataRepository = MainDataRepository();
    scaffoldKey = GlobalKey<ScaffoldState>();
    failure = Failure(0, '');
    listenForFlights();
    super.onInit();
  }

  Future<void> listenForFlights() async {
    mainDataRepository
        .getFlights(
            date: selectedDate,
            adultCount: adultCount,
            childCount: childrenCount,
            infantsCount: infantCount,
            cabin: cabin)
        .then((response) {
      response.fold((fail) {
        screenState.value = 1;
        failure = fail;
      }, (datum) {
        flightList.value=datum.flights!;
        if (flightList.isEmpty) {
          screenState.value = 2;
        }
      });
    });
  }
  Future<void> refreshPage() async {
    failure = Failure(0, '');
    flightList.value = [];
    listenForFlights();
  }
}
