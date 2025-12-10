import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

FDialogRouteStyle Function(Object?) blurredDialogStyle(BuildContext context) {
  return context.theme.dialogRouteStyle
      .copyWith(
        barrierFilter: (animation) => ImageFilter.compose(
          outer: ImageFilter.blur(sigmaX: animation * 5, sigmaY: animation * 5),
          inner: ColorFilter.mode(
            context.theme.colors.barrier,
            BlendMode.srcOver,
          ),
        ),
      )
      .call;
}

FModalSheetStyle Function(Object?) blurredSheetStyle(BuildContext context) {
  return context.theme.modalSheetStyle
      .copyWith(
        barrierFilter: (animation) => ImageFilter.compose(
          outer: ImageFilter.blur(sigmaX: animation * 5, sigmaY: animation * 5),
          inner: ColorFilter.mode(
            context.theme.colors.barrier,
            BlendMode.srcOver,
          ),
        ),
      )
      .call;
}
