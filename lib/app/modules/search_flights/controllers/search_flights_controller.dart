import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFlightsController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
