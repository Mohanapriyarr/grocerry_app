import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gropto_app/app/mdule/home_page/home_page_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        await _onBackPressed(context: context);
      },
      child:
       Scaffold(
        body: SafeArea(
          child: Obx(
            () => Stack(
              children: [
                controller.obx(
                  (state) =>
                      WebViewWidget(controller: controller.webViewController),
                  onLoading: _loader(),
                  onError: ((error) => Text(
                        error.toString(),
                        style: const TextStyle(fontSize: 16),
                      )),
                ),
                if (controller.isLoading.value) _loader(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _loader() {
    return Container(
      color: Colors.white,
      height: Get.size.height,
      width: Get.size.width,
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFFF6B00),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed({required BuildContext context}) async {
    return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Gropto',
                style: TextStyle(
                    color: Color(0xFFFF6B00), fontWeight: FontWeight.bold),
              ),
              content:
                  const Text('Are you sure you want to exit the application?'),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: <Widget>[
                _confiramationBtn(
                    context: context,
                    title: 'No',
                    containerColor: const Color.fromARGB(255, 202, 202, 202),
                    textColor: Colors.black,
                    onTap: () => Navigator.of(context).pop(false)),
                _confiramationBtn(
                    context: context,
                    title: 'Yes',
                    containerColor: const Color(0xFFFF6B00),
                    textColor: Colors.white,
                    onTap: () => SystemNavigator.pop()),
              ],
            );
          },
        ) ??
        false;
  }

  GestureDetector _confiramationBtn(
      {required BuildContext context,
      required String title,
      required Color containerColor,
      required Color textColor,
      Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: containerColor,
          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
          ),
        ));
  }
}
