import 'package:flutter/cupertino.dart';

import '../config/config.dart';

/*
 * 要具体显示的loading组件。
 */
class LoadingContainer extends StatefulWidget{
//公共配置
  CommonConfig commonConfig;

  LoadingConfig loadingConfig;

  LoadingContainer.showLoading({required this.commonConfig,required this.loadingConfig});

  @override
  State<StatefulWidget> createState() {
    return LoadingContainerState();
  }
}
class LoadingContainerState extends State<LoadingContainer>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // if(widget.commonConfig.dismissOnTap==true){
        //   CoreLoading.instance.dismiss();
        // }
      },
      child: Container(
        color: widget.commonConfig.maskColor,
        child: Center(
          child: widget.loadingConfig.widget,
        ),
      ),
    );
  }

}