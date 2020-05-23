import 'package:elmer_app/widgets/menus/SettingMenu.dart';
import 'package:elmer_app/widgets/user/UserInfoTopBar.dart';
import "package:flutter/material.dart";
// import "package:elmer_app/common/Utils.dart";
import "package:elmer_app/widgets/menus/SettingMenuGroup.dart";

class WUser extends StatelessWidget {
    final List<SettingMenuItemData> menuList1 = [
        new SettingMenuItemData("我的贷款", "assets/nav-fl-001.png"),
        new SettingMenuItemData("贷款计算", "assets/nav-fl-009.png"),
        new SettingMenuItemData("我的企业", "assets/nav-fl-002.png"),
        new SettingMenuItemData("我的预约", "assets/nav-fl-003.png")
    ];
    final List<SettingMenuItemData> menuList2 = [
        new SettingMenuItemData("安全中心", "assets/nav-fl-004.png"),
        new SettingMenuItemData("使用帮助", "assets/nav-fl-005.png"),
        new SettingMenuItemData("提交反馈", "assets/nav-fl-006.png"),
        new SettingMenuItemData("我要分享", "assets/nav-fl-007.png")
    ];
    final List<SettingMenuItemData> menuList3 = [
        new SettingMenuItemData("关于我们", "assets/nav-fl-008.png")
    ];
    final SettingMenuData menuData = new SettingMenuData([]);
    WUser() {
        print("Init App");
        this.menuData.add(SettingMenuGroupData(menuList1));
        this.menuData.add(SettingMenuGroupData(menuList2));
        this.menuData.add(SettingMenuGroupData(menuList3));
    }
    void onMenuClick() {
        print("Click from item");
    }
    showAlertDialog(BuildContext context, String message) {
        
        //设置按钮
        // Widget cancelButton = FlatButton(
        //     child: Text("Cancel"),
        //     onPressed:  () {
        //         Navigator.of(context).pop("SimpleDialogOption One");
        //     },
        // );
        Widget continueButton = FlatButton(
            child: Text("关闭"),
            onPressed:  () {
                Navigator.of(context).pop("SimpleDialogOption One");
            },
        );
        
        //设置对话框
        AlertDialog alert = AlertDialog(
            title: Text("提示"),
            content: Text("您点击了： " + message),
            
            actions: [
                // cancelButton,
                continueButton,
            ],
        );
        
        //显示对话框
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return alert;
            }
        );
    }
    @override
    Widget build(BuildContext context) {
        // double topWidth = MediaQuery.of(context).size.width;
        // double topHeight = Utils.calcHeight(topWidth, 750, 372);
        return new Scaffold(
            appBar: new AppBar(
                title: Text("我的"),
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 118, 158, 231),
                        Color.fromARGB(255, 100, 148, 233),
                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    ),
                ),
                elevation: 0
            ),
            body: SingleChildScrollView(
                child: GestureDetector(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            new UserInfoTopBar(),
                            new SettingMenu(this.menuData, onTap: (SettingMenuItemData e) {
                                showAlertDialog(context, e.title);
                            },)
                        ]
                    )
                )
            ),
        );
    }

}
