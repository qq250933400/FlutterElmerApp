import "package:flutter/material.dart";

class SettingMenuItem extends StatefulWidget {
    final String title;
    final String icon;
    final Function onClick;
    final String id;
    final Object data;
    SettingMenuItem(this.title, this.icon, {this.onClick, this.data, this.id});
    @override
    State<StatefulWidget> createState() {
        return SettingMenuItemState(this.title, this.icon,
            onClick: this.onClick, data: this.data);
    }
}

class SettingMenuItemState extends State<SettingMenuItem> {
  final double itemHeight = 60;
  final String title;
  final String icon;
  final Function onClick;
  final Object data;
  bool isPressed = false;
  SettingMenuItemState(this.title, this.icon, {this.onClick, this.data});
  void onClickEvent() {
    if (this.onClick is Function) {
      this.onClick(this.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onClickEvent,
        onTapDown: (TapDownDetails e) {
            this.setState(() {
                isPressed = true;
            });
        },
        onTapUp: (TapUpDetails e){
            this.setState(() {
                isPressed = false;
            });
        },
        onTapCancel: () {
            this.setState(() {
                isPressed = false;
            });
        },
        child: Container(
          height: itemHeight,
          child: DecoratedBox(
              decoration: BoxDecoration(
                border: new Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240), width: 1)),
                color: !isPressed ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 243,243,243),
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(this.icon,
                              width: 32, height: 32, fit: BoxFit.fitWidth),
                          height: this.itemHeight,
                        ),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(this.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 53, 53, 53))))),
                        Container(
                          child: Icon(Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color.fromARGB(255, 146, 146, 146)),
                          height: this.itemHeight,
                        )
                      ]))),
        ));
    }
}
