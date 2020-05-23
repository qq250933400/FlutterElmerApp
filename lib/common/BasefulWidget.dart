import 'package:flutter/material.dart';

abstract class BasefulWidget extends StatefulWidget {
    State<BasefulWidget> state;

    @override
    createState() => _BasefulWidgetState();

    @protected
    Widget build(BuildContext context);

    void initState(State<BasefulWidget> stateWidget) {
        this.state = stateWidget;
    }

    void dispose() {}
    void setState(VoidCallback callback ) {
        if(callback is Function) {
            this.state.setState(callback);
        } else {
            this.state.setState((){});
        }
    }
}

class _BasefulWidgetState extends State<BasefulWidget> {
    @override
    void initState() {
        super.initState();
        widget.initState(this);
    }

    @override
    Widget build(BuildContext context) {
        // widget.state = this;
        return widget.build(context);
    }

    @override
    void dispose() {
        super.dispose();
        widget.dispose();
    }
}
