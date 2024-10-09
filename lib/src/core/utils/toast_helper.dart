import 'package:another_flushbar/flushbar.dart';
import 'package:carma_app/src/core/constants/font_size.dart';
import 'package:carma_app/src/core/utils/sizer.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class Toast {
  static void showErrorToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.error,
    );
  }

  static void showWarningToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.warning,
    );
  }

  static void showSuccessToast({required String message}) {
    _toast(
      message: message,
      type: _ToastType.success,
    );
  }

  static void _toast({
    required String message,
    required _ToastType type,
  }) {
    Flushbar(
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.symmetric(
        horizontal: (kfsMedium.w),
        vertical: (kGlobalPadding.h),
      ),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      margin: EdgeInsets.symmetric(
        horizontal: (kfs8.w),
        vertical: screenHeight * .01,
      ),
      borderRadius: BorderRadius.circular((kMinute)),
      messageSize: (kfsMedium.sp),
      backgroundColor: switch (type) {
        _ToastType.error => Colors.red,
        _ToastType.warning => Colors.orange,
        _ToastType.success => Colors.green,
      },
      messageColor: switch (type) {
        _ToastType.error => Colors.white,
        _ToastType.warning => Colors.white,
        _ToastType.success => Colors.white,
      },
      duration: duration2s,
      icon: Icon(
        switch (type) {
          _ToastType.error => Icons.error_outline_rounded,
          _ToastType.warning => Icons.warning_amber_rounded,
          _ToastType.success => Icons.done_all_rounded,
        },
        color: switch (type) {
          _ToastType.error => Colors.white,
          _ToastType.warning => Colors.white,
          _ToastType.success => Colors.white,
        },
      ),
    ).show(StackedService.navigatorKey!.currentState!.context);
  }
}

enum _ToastType { error, warning, success }
