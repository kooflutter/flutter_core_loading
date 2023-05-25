//Toast位置枚举

import 'package:flutter/cupertino.dart';

/*
 * Toast位置枚举类，top，center or bottom
 */
enum ToastPosition{
  top,
  center,
  bottom
}

/*
 * 公共配置，此类配置是样式配置。
 */
class CommonConfig{
  //蒙层颜色
  Color? maskColor;
  //弹出层背景颜色
  Color? backgroundColor;
  //文字颜色
  Color? textColor;
  //文字大小
  double? fontSize;
  //弹出层圆角半径
  double? radius;
  //是否点击即消失
  bool? dismissOnTap;
  CommonConfig({this.maskColor,this.backgroundColor,this.textColor,this.fontSize,this.radius,this.dismissOnTap});
}
/*
 * Toast配置
 */
class ToastConfig{
  late String tipsText;
  //toast的弹出位置
  ToastPosition? toastPosition;
  Duration? toastTime;

  ToastConfig({required this.tipsText,this.toastPosition,this.toastTime});

  ToastConfig.getDefault(){
    tipsText="";
    toastPosition=ToastPosition.center;
    toastTime=Duration(seconds: 1);
  }

}
/*
 * Loading配置  未完成
 */
class LoadingConfig{
  //Loading的弹出位置
  late Widget widget;
  LoadingConfig({required this.widget});
  LoadingConfig.getDefault(){
    widget = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle
      ),
    );
  }
}

