import "package:flutter/material.dart";
import 'dart:async';

class LoginButton extends StatefulWidget {
    final double width;
    final double height;
    final String title;
    final BorderRadiusGeometry borderRadius;
    final VoidCallback onStartLogin;
    LoginButtonState _state;
    LoginButton({
        this.width,
        this.height,
        this.title,
        this.borderRadius,
        this.onStartLogin
    });

    @override
    State<StatefulWidget> createState() {
        this._state = LoginButtonState(
            width: this.width,
            height: this.height,
            title: this.title,
            borderRadius: this.borderRadius,
            onStartLogin: this.onStartLogin
        );
        return this._state;
    }
    void stop() {
        this._state.stopLoginAnimation();
    }
}

class LoginButtonState extends State<LoginButton> with SingleTickerProviderStateMixin {
    final double width;
    final double height;
    final String title;
    final BorderRadiusGeometry borderRadius;
    final VoidCallback onStartLogin;

    AnimationController widthAninationController;
    Animation<double> widthAnimation;

    bool isWidthAnimation = false;
    bool showLoading = false;
    bool showLogon = true;
    bool isPressed = false;

    LoginButtonState({
        this.title = "登录",
        this.width = 200,
        this.height = 50,
        this.borderRadius,
        this.onStartLogin
    });

    void onLoginTap() {
        if(!this.isWidthAnimation) {
            startLoginAnimation();
            print("onButtonTab");
        }
    }
    Gradient getButtonBackground() {
        if(this.isPressed) {
            return LinearGradient(
                colors: [
                    Color.fromARGB(255, 0, 93, 234),
                    Color.fromARGB(255, 0, 197, 251)
                ],
                begin: Alignment.topCenter,
                end: Alignment.centerRight
            );
        } else {
            return LinearGradient(
                colors: [
                    Color.fromARGB(255, 51,51,51),
                    Color.fromARGB(255, 51,51,51)
                ],
                begin: Alignment.topCenter,
                end: Alignment.centerRight
            );
        }
    }
    @override
    Widget build(BuildContext context) {
        double defaultWidth =  this.width > 0 ? this.width : 100;
        double logonButtonWidth = isWidthAnimation ? widthAnimation.value : defaultWidth;
        double logonButtonHeight = this.height > 0 ? this.height : 50;
        BorderRadiusGeometry myRadius = null != this.borderRadius ? this.borderRadius : BorderRadius.all(
            const Radius.circular(1.0)
        );
        return GestureDetector(
            onTap: onLoginTap,
            onTapDown: (TapDownDetails e) {
                if(!this.isWidthAnimation) {
                    setState(() {
                        this.isPressed = true;
                    });
                }
            },
            onTapCancel: () {
                if(!this.isWidthAnimation) {
                    setState(() {
                        this.isPressed = false;
                    });
                }
            },
            onTapUp: (TapUpDetails e) {
                if(!this.isWidthAnimation) {
                    setState(() {
                        this.isPressed = false;
                    });
                }
            },
            child: Container(
                width: logonButtonWidth,
                height: logonButtonHeight,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: myRadius,
                    gradient: getButtonBackground()
                ),
                child: Center(
                    child: !this.showLoading ? Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                        )) : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                ),
            ),
        );
    }

    @override
    void initState() {
        double logonButtonWidth = this.width > 0 ? this.width : 100;
        double logonButtonHeight = this.height > 0 ? this.height : 50;
        // 在state初始化时调用
        widthAninationController = new AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
        widthAnimation = new Tween(begin: logonButtonWidth, end: logonButtonHeight)
            .animate(widthAninationController)
            ..addListener(() {
                
                if(widthAnimation.isCompleted || widthAnimation.status == AnimationStatus.dismissed) {
                    setState((){
                        if(!this.showLogon) {
                            this.showLoading = false;
                            this.isWidthAnimation = false;
                        } else {
                            this.showLoading = true;
                        }
                    });
                    if(widthAnimation.status != AnimationStatus.dismissed) {
                        _doLogin();
                    } else {
                        this.isWidthAnimation = false;
                    }
                    print(widthAnimation.status);
                } else {
                    setState(() {});
                }
            });
    }
    void startLoginAnimation() {
        isWidthAnimation = true;
        showLogon = true;
        widthAninationController.forward();
        print("Go Start");
    }
    void stopLoginAnimation() {
        this.showLoading = false;
        this.isWidthAnimation = true;
        this.showLogon = false;
        widthAninationController.reverse();
    }
    @override
    void dispose() {
        super.dispose();
        widthAninationController.dispose();
    }
    void _doLogin() {
        if(this.onStartLogin is Function) {
            this.onStartLogin();
        }
    }
}