import 'package:calculator_app/data/model.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;


class InAppWebViewScreen extends StatefulWidget {
  final SideMenu sideMenu;

  InAppWebViewScreen(this.sideMenu);

  @override
  _InAppWebViewScreenState createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    String viewID = "home_web_view_loader_"+count.toString();
    count++;
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
            (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = widget.sideMenu.htmlFilePath
          ..style.border = 'none');
    return HtmlElementView(
      viewType: viewID,
    );

  }
}