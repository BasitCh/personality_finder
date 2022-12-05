import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String webviewUrl;
  final String title;

  const WebViewScreen({
    required this.webviewUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreeneState();
}

class _WebViewScreeneState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
        title: StandardText.bodyMedium(context, widget.title),
      ),
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: widget.webviewUrl,
                javascriptMode: JavascriptMode.unrestricted,
                // ignore: unnecessary_lambdas
                onWebViewCreated: (webViewController) {
                  _controller.complete(webViewController);
                },
                gestureNavigationEnabled: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
