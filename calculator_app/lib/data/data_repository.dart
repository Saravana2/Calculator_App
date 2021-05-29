

import 'package:calculator_app/data/model.dart';

class DataRepository{
  static List<SideMenu> get sideMenuItemsWithActions{
    List<SideMenu> sideMenus = [];
    sideMenus.add(SideMenu(1,"Percentage" , "assets/page1/index.html"));
    sideMenus.add(SideMenu(2,"Binance Fee" , "assets/page2/index.html"));
    return sideMenus;
  }
}