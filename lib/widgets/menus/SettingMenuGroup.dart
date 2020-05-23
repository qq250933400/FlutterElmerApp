import "package:flutter/material.dart";

import 'SettingMenuItem.dart';

class SettingMenuItemData {
    final String title;
    final String icon;
    SettingMenuItemData(this.title, this.icon);
}

class SettingMenuGroup extends StatelessWidget {
    final List<SettingMenuItemData> data;
    final Function onClick;
    SettingMenuGroup(this.data, {this.onClick});

    @override
    Widget build(BuildContext context) {
        List<SettingMenuItemData> renderData = null != this.data && this.data.length > 0 ? this.data : [];
        List<Widget> childrenList = [];
        for(var item in renderData) {
            childrenList.add(
                new SettingMenuItem(item.title, item.icon, onClick: (Object itemData) => {
                    if(null != this.onClick) {
                        this.onClick(itemData)
                    }
                },
                data: item)
            );
        }
        return Container(
            child: Column(
                children: childrenList
            )
        );
    }
}