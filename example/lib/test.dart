import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_core_loading/flutter_core_loading.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    // CoreLoading.dismiss();
    CoreLoading.showSuccess('Use in initState');
    CoreLoading.addStatusCallback(statusCallback);
  }

  @override
  void deactivate() {
    CoreLoading.dismiss();
    CoreLoading.removeCallback(statusCallback);
    super.deactivate();
  }

  void statusCallback(CoreLoadingStatus status) {
    print('Test CoreLoading Status $status');
  }

  void loadData() async {
    try {
      await CoreLoading.show();
      HttpClient client = HttpClient();
      HttpClientRequest request =
          await client.getUrl(Uri.parse('https://github.com'));
      HttpClientResponse response = await request.close();
      print(response);
      await CoreLoading.dismiss();
    } catch (e) {
      await CoreLoading.showError(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('loadData'),
          onPressed: () {
            CoreLoading.show(status: '加载中...');
            // loadData();
            // await Future.delayed(Duration(seconds: 2));
            // CoreLoading.show(status: 'loading...');
            // await Future.delayed(Duration(seconds: 5));
            // CoreLoading.dismiss();
          },
        ),
      ),
    );
  }
}
