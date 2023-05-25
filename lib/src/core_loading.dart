import 'package:flutter/cupertino.dart';
import 'package:flutter_core_loading/src/widget/loading.dart';
import 'package:flutter_core_loading/src/widget/loading_container.dart';
import 'package:flutter_core_loading/src/widget/overlay_entry.dart';
import 'package:flutter_core_loading/src/widget/toast_container.dart';

import 'config/config.dart';

/*
 * 控制整个loading初始化，配置，显示等的单例类。
 * 负责处理所有loading相关操作
 */
class CoreLoading{
  //单例类实例，外界据此获得核心loading单例
  static final CoreLoading instance = CoreLoading._();
  //私有化构造方法
  CoreLoading._();

  //CoreLoading初始化方法。外界如果传build过来则需要进行一层包装。此处类似于套娃。
  static TransitionBuilder init({TransitionBuilder? builder,}) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, FlutterCoreLoading(child: child));
      } else {
        return FlutterCoreLoading(child: child);
      }
    };
  }


  late CommonConfig _commonConfig;
  //初始化外界配置
  void initConfig(CommonConfig config){
    _commonConfig=config;
  }


  Widget? get container => _container;

  //具体loading
  Widget? _container;
  CoreLoadingOverlayEntry? overlayEntry;

  showToast(String tipsText,{ToastConfig? toastConfig}){
    if(overlayEntry==null){
      print("注意：您还没有调用CoreLoading.init方法去初始化overlayEntry组件");
    }else{
      if(toastConfig==null){
        toastConfig = ToastConfig.getDefault();
      }
      toastConfig.tipsText=tipsText;
      _container=ToastContainer.showToast(commonConfig: _commonConfig,toastConfig: toastConfig,);
      overlayEntry?.markNeedsBuild();
      Future.delayed(toastConfig.toastTime??Duration(seconds: 1)).then((value) => dismiss());
    }
  }

  showLoading({LoadingConfig? loadingConfig}){
    if(overlayEntry==null){
      print("注意：您还没有调用CoreLoading.init方法去初始化overlayEntry组件");
    }else{
      if(loadingConfig==null){
        loadingConfig = LoadingConfig.getDefault();
      }
      _container=LoadingContainer.showLoading(commonConfig: _commonConfig,loadingConfig: loadingConfig,);
      overlayEntry?.markNeedsBuild();
      Future.delayed(Duration(seconds: 5)).then((value) => dismiss());
    }
  }

  dismiss() {
    _container=null;
    overlayEntry?.markNeedsBuild();
  }
}