import 'package:calculator_app/data/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewScreen extends StatefulWidget {
  final SideMenu sideMenu;

  InAppWebViewScreen(this.sideMenu);

  @override
  _InAppWebViewScreenState createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  InAppWebViewController? _webViewController;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    if (_webViewController != null)
      _webViewController?.loadFile(assetFilePath: widget.sideMenu.htmlFilePath);
    return InAppWebView(
      initialFile: widget.sideMenu.htmlFilePath,
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              supportZoom: false, cacheEnabled: false, clearCache: true),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          )),
      onWebViewCreated: (InAppWebViewController controller) {
        _webViewController = controller;
      },
      onProgressChanged:
          (InAppWebViewController controller, int progress) {},
    );
  }
}
