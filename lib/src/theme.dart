// The MIT License (MIT)
//
// Copyright (c) 2020 nslogx
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import 'package:flutter/material.dart';

import './core_loading.dart';
import './animations/animation.dart';
import './animations/opacity_animation.dart';
import './animations/offset_animation.dart';
import './animations/scale_animation.dart';

class CoreLoadingTheme {
  /// color of indicator
  static Color get indicatorColor =>
      CoreLoading.instance.loadingStyle == CoreLoadingStyle.custom
          ? CoreLoading.instance.indicatorColor!
          : CoreLoading.instance.loadingStyle == CoreLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// progress color of loading
  static Color get progressColor =>
      CoreLoading.instance.loadingStyle == CoreLoadingStyle.custom
          ? CoreLoading.instance.progressColor!
          : CoreLoading.instance.loadingStyle == CoreLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// background color of loading
  static Color get backgroundColor =>
      CoreLoading.instance.loadingStyle == CoreLoadingStyle.custom
          ? CoreLoading.instance.backgroundColor!
          : CoreLoading.instance.loadingStyle == CoreLoadingStyle.dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white;

  /// boxShadow color of loading
  static List<BoxShadow>? get boxShadow =>
      CoreLoading.instance.loadingStyle == CoreLoadingStyle.custom
          ? CoreLoading.instance.boxShadow ?? [BoxShadow()]
          : null;

  /// font color of status
  static Color get textColor =>
      CoreLoading.instance.loadingStyle == CoreLoadingStyle.custom
          ? CoreLoading.instance.textColor!
          : CoreLoading.instance.loadingStyle == CoreLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// mask color of loading
  static Color maskColor(CoreLoadingMaskType? maskType) {
    maskType ??= CoreLoading.instance.maskType;
    return maskType == CoreLoadingMaskType.custom
        ? CoreLoading.instance.maskColor!
        : maskType == CoreLoadingMaskType.black
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent;
  }

  /// loading animation
  static CoreLoadingAnimation get loadingAnimation {
    CoreLoadingAnimation _animation;
    switch (CoreLoading.instance.animationStyle) {
      case CoreLoadingAnimationStyle.custom:
        _animation = CoreLoading.instance.customAnimation!;
        break;
      case CoreLoadingAnimationStyle.offset:
        _animation = OffsetAnimation();
        break;
      case CoreLoadingAnimationStyle.scale:
        _animation = ScaleAnimation();
        break;
      default:
        _animation = OpacityAnimation();
        break;
    }
    return _animation;
  }

  /// font size of status
  static double get fontSize => CoreLoading.instance.fontSize;

  /// size of indicator
  static double get indicatorSize => CoreLoading.instance.indicatorSize;

  /// width of progress indicator
  static double get progressWidth => CoreLoading.instance.progressWidth;

  /// width of indicator
  static double get lineWidth => CoreLoading.instance.lineWidth;

  /// loading indicator type
  static CoreLoadingIndicatorType get indicatorType =>
      CoreLoading.instance.indicatorType;

  /// toast position
  static CoreLoadingToastPosition get toastPosition =>
      CoreLoading.instance.toastPosition;

  /// toast position
  static AlignmentGeometry alignment(CoreLoadingToastPosition? position) =>
      position == CoreLoadingToastPosition.bottom
          ? AlignmentDirectional.bottomCenter
          : (position == CoreLoadingToastPosition.top
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center);

  /// display duration
  static Duration get displayDuration => CoreLoading.instance.displayDuration;

  /// animation duration
  static Duration get animationDuration =>
      CoreLoading.instance.animationDuration;

  /// contentPadding of loading
  static EdgeInsets get contentPadding => CoreLoading.instance.contentPadding;

  /// padding of status
  static EdgeInsets get textPadding => CoreLoading.instance.textPadding;

  /// textAlign of status
  static TextAlign get textAlign => CoreLoading.instance.textAlign;

  /// textStyle of status
  static TextStyle? get textStyle => CoreLoading.instance.textStyle;

  /// radius of loading
  static double get radius => CoreLoading.instance.radius;

  /// should dismiss on user tap
  static bool? get dismissOnTap => CoreLoading.instance.dismissOnTap;

  static bool ignoring(CoreLoadingMaskType? maskType) {
    maskType ??= CoreLoading.instance.maskType;
    return CoreLoading.instance.userInteractions ??
        (maskType == CoreLoadingMaskType.none ? true : false);
  }
}
