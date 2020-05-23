import 'package:flutter/material.dart';



abstract class StatefulWithTickerWidget extends StatefulWidget {
    State<StatefulWithTickerWidget> state;

    @override
    createState() => StatefulWithTickerWidgetState();

    @protected
    Widget build(BuildContext context);

 
    void myInitState(StatefulWithTickerWidget handler);

    void initState(State<StatefulWithTickerWidget> stateWidget) {
        this.state = stateWidget;
        if(this.myInitState is Function) {
            this.myInitState(this);
        }
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

class StatefulWithTickerWidgetState extends State<StatefulWithTickerWidget> with TickerProviderStateMixin {
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
