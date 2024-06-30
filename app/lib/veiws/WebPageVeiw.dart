import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl:
            'https://BioVoltex.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    // This WebView displays a BIOVOLTEX website
  }
}
