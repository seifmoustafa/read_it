import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({super.key, required this.url});

  final String url;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview',
          style: Styles.textStyle14,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.disabled)
            ..loadRequest(Uri.parse(widget.url)),
        ),
      ),
    );
  }
}
