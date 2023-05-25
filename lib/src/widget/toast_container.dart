/*
 * 要具体显示的Toast组件。
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_core_loading/flutter_core_loading.dart';


class ToastContainer extends StatefulWidget{
  //公共配置
  CommonConfig commonConfig;
  //toast配置
  late ToastConfig toastConfig;

  ToastContainer.showToast({required this.commonConfig,required this.toastConfig}){}

  @override
  State<StatefulWidget> createState() {
    return ToastContainerState();
  }
}

class ToastContainerState extends State<ToastContainer>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.commonConfig.dismissOnTap==true){
          CoreLoading.instance.dismiss();
        }
      },
      child: Container(
        color: const Color(0x00000000),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: widget.commonConfig.backgroundColor??const Color(0x1aFF0000),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(widget.toastConfig.tipsText),
          ),
        ),
      ),
    );
  }
}