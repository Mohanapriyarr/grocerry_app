import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageController extends GetxController with StateMixin<bool> {
  late WebViewController webViewController;

  final isLoading = true.obs;

final lastTapDown = 0.obs;

  //FE5F1E

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    webViewController = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.gropto.com/'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isLoading.value = false;
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
