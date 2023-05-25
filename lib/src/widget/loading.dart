import 'package:flutter/material.dart';

import '../../flutter_core_loading.dart';
import 'overlay_entry.dart';

/*
 * loading 大组件，承载Overlay 和 OverlayEntry
 */
class FlutterCoreLoading extends StatefulWidget{
  final Widget? child;

  const FlutterCoreLoading({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  FlutterCoreLoadingState createState() => FlutterCoreLoadingState();
}
class FlutterCoreLoadingState extends State<FlutterCoreLoading> {
  late CoreLoadingOverlayEntry _overlayEntry;
  @override
  void initState() {
    _overlayEntry = CoreLoadingOverlayEntry(
      builder: (BuildContext context) => CoreLoading.instance.container ?? Container(),
    );
    CoreLoading.instance.overlayEntry = _overlayEntry;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          CoreLoadingOverlayEntry(
            builder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }

}