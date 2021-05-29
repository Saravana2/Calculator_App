import 'package:calculator_app/data/data_repository.dart';
import 'package:calculator_app/data/model.dart';
import 'package:calculator_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import 'inapp_webview_screen.dart' if (dart.library.html) 'webview_browser.dart'
    as multiPlatform;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SideMenu> sideMenus = DataRepository.sideMenuItemsWithActions;
  int _selectedItemPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.app_name),
      ),
      drawer: PointerInterceptor(child: _getDrawer()),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            sideMenus[_selectedItemPosition].menuItemText,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          SizedBox(height: 8.0),
          Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2),borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: multiPlatform.InAppWebViewScreen(
                    sideMenus[_selectedItemPosition]),
              ))
        ],
      ),
    );
  }

  Widget _getDrawer() {
    return Drawer(
      child: ListView(
        children: _generateDrawerMenuItems(),
      ),
    );
  }

  Widget _getDrawerHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calculate,
                size: 48.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                AppStrings.app_name,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              )
            ],
          ),
        ));
  }

  List<Widget> _generateDrawerMenuItems() {
    List<Widget> menuItems = [];
    menuItems.add(_getDrawerHeader());

    for (var i = 0; i < sideMenus.length; i++) {
      menuItems.add(_getSideMenuItem(i));
    }
    return menuItems;
  }

  Widget _getSideMenuItem(int position) {
    return ListTile(
      tileColor: _selectedItemPosition == position ? Colors.blue.shade50 : Colors.white,
      title: Text(sideMenus[position].menuItemText),
      onTap: () {
        _onMenuItemClicked(sideMenus[position], position);
      },
    );
  }

  _onMenuItemClicked(SideMenu sideMenu, int position) {
    setState(() {
      _selectedItemPosition = position;
    });
    Navigator.pop(context);
  }
}
