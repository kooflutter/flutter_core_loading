# flutter\_core\_loading 简介

flutter\_core\_loading 插件是一个支持弹出通用toast和loading的flutter插件包，支持安卓，IOS，等各种平台。

## git仓库地址

[flutter\_core\_loading](https://github.com/kooflutter/flutter_core_loading)

## 使用说明

### 依赖集成

    dependencies:
        flutter_core_loading: ^0.0.5

### 使用三板斧

#### 1.初始化

<!---->

    MaterialApp(
     builder: CoreLoading.init(),
     home: Scaffold(
       appBar: ...,
       body: ...,
     ),
    )

注：

    1.上面...为省略代码
    2.在MaterialApp中添加builder: CoreLoading.init()
    3.如果原先已有build可将原先的buid放进init参数的可选方法中。CoreLoading.init(builder: preBuilder)

#### 2.配置公共参数

    void main() {
      runApp(const MyApp());
      configLoading();
    }
    void configLoading(){
      var commConfig = CommonConfig();
      commConfig
        ..maskColor=const Color(0x1A000000)
        ..backgroundColor=const Color(0xFFFFFFFF)
        ..fontSize=14
        ..dismissOnTap=true
        ..textColor=const Color(0xFF32374E)
        ..radius=10;
      CoreLoading.instance.initConfig(commConfig);
    }

注：`在runApp方法调用之后，即可调用CoreLoading的initConfig方法来进行公共配置的初始化`

#### 3.公参说明

| 参数              | 说明        |
| --------------- | --------- |
| maskColor       | 蒙层颜色      |
| backgroundColor | 展示的背景色    |
| fontSize        | 展示的文字大小   |
| dismissOnTap    | 点击是否消失    |
| textColor       | 展示的文字颜色   |
| radius          | 展示的背景圆角半径 |

#### 4.展示Toast

    CoreLoading.instance.showToast("tipsText");

`同时展示toast时可以在showToast方法中额外配置展示位置和展示时间，具体请看 ToastConfig`

#### 5.展示任意自定义的loading图或者动画等视图

    CoreLoading.instance.showLoading();

`同时展示loading时可以额外配置要展示的具体的loadingView，具体请看LoadingConfig`
