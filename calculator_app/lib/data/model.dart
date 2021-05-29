


class SideMenu {
  final int menuId;
  final String menuItemText;
  final String htmlFilePath;

  SideMenu(this.menuId, this.menuItemText, this.htmlFilePath);

  SideMenu.fromJson(Map<String, dynamic> json)
      : menuId = json['menuId'],menuItemText = json['menuItemText'], htmlFilePath = json['htmlFilePath'];

  Map<String, dynamic> toJson() => {
    'menuId': menuId,
    'menuItemText': menuItemText,
    'htmlFilePath': htmlFilePath,
  };
}