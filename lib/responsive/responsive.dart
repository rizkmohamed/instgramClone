import 'package:flutter/material.dart';
import 'package:instgramclone/utils/strings.dart';

class RespansiveLayout extends StatelessWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const RespansiveLayout(
      {Key? key, required this.webScreen, required this.mobileScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight > webScreenSize) {
          return webScreen;
        }
        return mobileScreen;
      },
    );
  }
}
