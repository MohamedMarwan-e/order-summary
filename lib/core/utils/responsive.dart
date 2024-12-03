import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    required this.web,
    required this.mobile,
    this.tablet,
    super.key,
  });

  final Widget mobile;
  final Widget web;
  final Widget? tablet;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1100 &&
          MediaQuery.sizeOf(context).width >= 650;

  static bool isWeb(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;

  @override
  Widget build(BuildContext context) {
    if (isWeb(context)) {
      return web;
    } else if (isTablet(context)) {
      return tablet??web;
    }
    return mobile;
  }
}
