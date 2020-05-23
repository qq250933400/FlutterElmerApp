import 'dart:async';

import 'package:elmer_app/common/BasefulWidget.dart';
import 'package:elmer_app/common/Utils.dart';
import 'package:elmer_app/widgets/button/LoginButton.dart';
import 'package:elmer_app/widgets/input/LoginInput.dart';
import "package:flutter/material.dart";

class Login extends BasefulWidget {
    bool inputDisabled = false;
    LoginButton _loginButton;
    int tim = 0;
    void onLoginTap() {
        setState((){
            this.inputDisabled = true;
            this.tim = this.tim + 1;
            print("Update status");
        });
    }
    @override
    Widget build(BuildContext context) {
        double width = Utils.getWidth(context), height = Utils.getHeight(context);
        double topHeight = height * 0.45;
        double headerRadius = Utils.calcWidth(100, 120, 120);
        double headerTop = topHeight - headerRadius - 100;
        double logonButtonWidth = (width - 80);
        double logonButtonHeight = 50;
        if(null == this._loginButton) {
            this._loginButton = LoginButton(
                width: logonButtonWidth,
                height: logonButtonHeight,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                title: "登录",
                onStartLogin: () {
                    Timer.periodic(Duration(milliseconds: 6000), (Timer e) =>{
                        if(null != this._loginButton) {
                            this._loginButton.stop()
                        }
                    });
                },
            );
        }

        return Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/img-01.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                    Color.fromARGB(220, 0, 91,234),
                                    Color.fromARGB(200, 0, 198, 251)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter
                            )
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                // 用户头像或公司logo
                                Container(
                                    height: topHeight,
                                    width: width,
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, headerTop, 0, 20),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                CircleAvatar(
                                                    radius: headerRadius / 2,
                                                    backgroundImage: AssetImage("assets/avatar-01.jpg"),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                                    child: Text("UserName", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                // 登录输入区域
                                Container(
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                                LoginInput(placeholder: "请输入邮箱或手机",icon: Icons.account_circle, disabled: this.inputDisabled),
                                                LoginInput(placeholder: "请输入密码" + this.tim.toString(), icon: Icons.lock, margin: EdgeInsets.fromLTRB(0, 15, 0, 0), isPassword: true,disabled: this.inputDisabled)
                                            ],
                                        )
                                    ),
                                ),
                                Container(
                                    padding: EdgeInsets.fromLTRB(40, 80, 40,20),
                                    width: width,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                            (null != this._loginButton ? this._loginButton : Text("No Button"))
                                        ],
                                    )
                                )
                            ],
                        ),
                    )
                )
            )
        );
    }

}