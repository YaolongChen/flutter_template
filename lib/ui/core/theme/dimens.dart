import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  double get screenVerticalPadding;

  double get screenHorizontalPadding;

  EdgeInsets get screenPadding => EdgeInsets.symmetric(
    vertical: screenVerticalPadding,
    horizontal: screenHorizontalPadding,
  );

  static const mobile = _DimensMobile();

  static const desktop = _DimensDesktop();

  factory Dimens.of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return switch (width) {
      > 600 => desktop,
      _ => mobile,
    };
  }
}

final class _DimensMobile extends Dimens {
  const _DimensMobile();

  @override
  double get screenVerticalPadding => 16.0;

  @override
  double get screenHorizontalPadding => 16.0;
}

final class _DimensDesktop extends Dimens {
  const _DimensDesktop();

  @override
  double get screenVerticalPadding => 24.0;

  @override
  double get screenHorizontalPadding => 24.0;
}
