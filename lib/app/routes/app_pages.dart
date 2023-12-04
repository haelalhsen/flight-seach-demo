import 'package:get/get.dart';

import '../modules/search_flights/bindings/search_flights_binding.dart';
import '../modules/search_flights/views/search_flights_view.dart';
import '../modules/search_result/bindings/search_result_binding.dart';
import '../modules/search_result/views/search_result_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // GetPage(
    //   name: _Paths.PROJECT_DETAILS,
    //   page: () => const ProjectDetailsView(),
    //   binding: ProjectDetailsBinding(),
    //   showCupertinoParallax: true,
    //   transition: Transition.rightToLeft,
    // ),
    GetPage(
      name: _Paths.SEARCH_FLIGHTS,
      page: () => const SearchFlightsView(),
      binding: SearchFlightsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
    ),
  ];
}
