import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl:
            'https://www.bing.com/search?pglt=41&q=google+translate&cvid=1c99c8c875694d6f898d005fdeb535e4&gs_lcrp=EgZjaHJvbWUqBggCEC4YQDIGCAAQRRg5MgYIARAuGEAyBggCEC4YQDIGCAMQRRg7MgYIBBAAGEAyBggFEC4YQDIGCAYQRRg8MgYIBxBFGDwyBggIEEUYPNIBCDIzMTFqMGoxqAIIsAIB&FORM=ANNTA1&PC=SCOOBE',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    // This WebView displays a BIOVOLTEX website
  }
}
