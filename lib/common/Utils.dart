import 'package:flutter/cupertino.dart';

class Utils {
    ///输入设置高度，根据原始图片尺寸计算宽度
    static double calcWidth(double inputHeight, double fixWidth, double fixHeight) {
        return (inputHeight * fixWidth / fixHeight);
    }
    ///输入设置宽度，根据原始图片尺寸计算高度
    static double calcHeight(double inputWidth, double fixWidth, double fixHeight) {
        return (inputWidth * fixHeight / fixWidth);
    }
    static double getHeight(BuildContext context) {
        return MediaQuery.of(context).size.height;
    }
    static double getWidth(BuildContext context) {
        return MediaQuery.of(context).size.width;
    }
}
