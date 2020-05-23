import "package:flutter/material.dart";

class LoginInput extends StatefulWidget {
    final String placeholder;
    final IconData icon;
    final double height;
    final EdgeInsets margin;
    final bool isPassword;
    bool disabled;

    LoginInput({this.placeholder = "请输入文本", this.icon = Icons.account_circle,this.margin, this.height = 50, this.isPassword = false, this.disabled});
    @override
    State<StatefulWidget> createState() {
        return LoginInputState(placeholder: this.placeholder, icon: this.icon, height: this.height, margin: this.margin, isPassword:this.isPassword, disabled: this.disabled);
    }
}

class LoginInputState extends State<LoginInput> with TickerProviderStateMixin {
    final String placeholder;
    final IconData icon;
    final double height;
    final EdgeInsets margin;
    final bool isPassword;
    final bool disabled;

    AnimationController controller;
    Animation<double> animation;
    Animation<double> lFAnimation;
    AnimationController lFController;
    FocusNode inputFocusNode;
    bool hasFocus = false, hasDoAnimation = false;
    double initOffsetValue = 6.0;
    Color iconColor = Colors.grey;

    LoginInputState({this.placeholder, this.icon,this.margin, this.height = 50, this.isPassword = false, this.disabled});
    
    initState() {
        super.initState();

        controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
        lFController = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
        animation = new Tween(begin: 6.0, end: 0.0).animate(controller)
            ..addListener(() {
                setState(() {
                // the state that has changed here is the animation object’s value
                });
            });
        lFAnimation = new Tween(begin: 0.0, end: 6.0).animate(lFController)
            ..addListener(() {
                setState((){
                    // the state tha has changed here is the animation object's value
                });
            });
        inputFocusNode = FocusNode();
        inputFocusNode.addListener(() {
            hasDoAnimation = true;
            if(inputFocusNode.hasFocus) {
                hasFocus = true;
                iconColor = Colors.green;
                lFController.reset();
                controller.forward();
            } else {
                iconColor = Colors.grey;
                hasFocus = false;
                controller.reset();
                lFController.forward();
            }
         });
        // controller.forward();
    }

    @override
    dispose() {
        inputFocusNode.unfocus();
        controller.dispose();
        lFController.dispose();
        super.dispose();
    }
    @override
    Widget build(BuildContext context) {
        double dHeight = this.height > 0 ? this.height : 50;
        double dRadius = dHeight / 2;
        double iconAreaWidth = 50;
        double iconOffset = hasDoAnimation ? (hasFocus ? animation.value : lFAnimation.value) : initOffsetValue;
        bool isEnabled = this.disabled == null ? true : !this.disabled;
        print("FieldText Enabled: " + isEnabled.toString());
        print("FieldText Disabled: " + this.disabled.toString());
        print(this.placeholder);
        return Container(
            margin: this.margin,
            child: new Material(
                borderRadius: BorderRadius.all(new Radius.circular(dRadius)),
                clipBehavior: Clip.antiAlias,
                child: Container(
                    height: dHeight,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Container(
                                width: iconAreaWidth,
                                height: dHeight,
                                child: new Transform.translate(
                                    offset: Offset(iconOffset, 0),
                                    child: Icon(this.icon, color: iconColor,),
                                )
                            ),
                            Expanded(
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: this.placeholder
                                    ),
                                    focusNode: inputFocusNode,
                                    obscureText: this.isPassword,
                                    keyboardType: this.isPassword ? TextInputType.visiblePassword : TextInputType.text,
                                    enabled: isEnabled,
                                ),
                            )
                        ],
                    )
                ),
            )
        );
    }
}
