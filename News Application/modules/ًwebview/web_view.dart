import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web_view_screen extends StatelessWidget {
 late WebViewController controller;
 final String url;

 web_view_screen(this.url);
  @override
  Widget build(BuildContext context) {

controller=
WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse("${url}"));
return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );

  }
}
