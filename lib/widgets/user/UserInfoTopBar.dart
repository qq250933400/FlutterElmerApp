import "package:flutter/material.dart";
import "package:elmer_app/common/Utils.dart";

class UserInfoTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double topWidth = MediaQuery.of(context).size.width;
    double topHeight = Utils.calcHeight(topWidth, 750, 372);
    return new DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new ExactAssetImage('assets/head.png'),
                fit: BoxFit.fitWidth)),
        child: Container(
          constraints: BoxConstraints(minWidth: topWidth, minHeight: topHeight),
          width: topWidth,
          height: topHeight,
          child: Padding(
              padding: new EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset("assets/user.png", width: 80, height: 80),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text("欢迎登陆",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255))))),
                  IconButton(
                      iconSize: 30,
                      onPressed: null,
                      icon: Icon(Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 255, 255, 255), size: 40))
                ],
              )),
        ));
  }
}
