import "package:flutter/material.dart";
import "package:elmer_app/widgets/menus/SettingMenuGroup.dart";

class SettingMenuGroupData {
    List<SettingMenuItemData> data;
    SettingMenuGroupData(this.data);
    void add(SettingMenuItemData data) {
        if(this.data != null) {
            this.data.add(data);
        } else {
            this.data = [];
            this.data.add(data);
        }
    }
}

class SettingMenuData {
    List<SettingMenuGroupData> data;
    SettingMenuData(this.data);
    void add(SettingMenuGroupData data) {
        if(null != this.data) {
            this.data.add(data);
        } else {
            this.data = [];
            this.data.add(data);
        }
    }
    void addItem(int groupIndex, SettingMenuItemData itemData) {
        if(null != this.data) {
            if(groupIndex >=0 && groupIndex<this.data.length) {
                this.data[groupIndex].add(itemData);
            } else {
                throw new Exception("the groupIndex is out of array range");
            }
        } else {
            throw new Exception("No Group item found, please set group data first");
        }
    } 
}


class SettingMenu extends StatelessWidget {
    final SettingMenuData data;
    final Function(SettingMenuItemData data) onTap;
    SettingMenu(this.data, {this.onTap});
    @override
    Widget build(BuildContext context) {
        SettingMenuData myData = null != this.data ? this.data : [];
        List<Widget> list = [];
        int index = 0;
        int maxIndex = myData.data.length;
        for(var groupData in myData.data) {
            list.add(new SettingMenuGroup(groupData.data, onClick: (SettingMenuItemData item) => {
                if(this.onTap is Function) {
                    this.onTap(item)
                }
            },));
            if(index<maxIndex - 1) {
                list.add(Container(
                    height: 15,
                    child: DecoratedBox(decoration: BoxDecoration(
                        color: Colors.grey
                    ))
                ));
            }
        }
        return Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list,
            )
        );
    }
}