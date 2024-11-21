import 'package:get/get.dart';
import 'package:gropto_app/app/mdule/home_page/home_page_binding.dart';
import 'package:gropto_app/app/mdule/home_page/home_page_view.dart';
import 'package:gropto_app/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final route = [
    GetPage(
        name: Paths.HOME,
      page: () =>  HomePageView(),
        binding: HomePageBinding())
  ];
}
