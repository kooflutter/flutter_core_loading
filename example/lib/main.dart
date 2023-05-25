import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_core_loading/flutter_core_loading.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: CoreLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('loading test'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  CoreLoading.instance.showToast("tipsText");
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("show Toast"),
                ),
              ),
              GestureDetector(
                onTap: (){
                  CoreLoading.instance.showLoading();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("show loading"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
