 import 'package:get/get.dart';
import 'package:gropto_app/app/mdule/home_page/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
       Get.lazyPut<HomePageController>(() => HomePageController());
  }

 }