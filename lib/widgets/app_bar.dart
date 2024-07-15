import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/colors.dart';

AppBar getAppBar(String title,
    {List<Widget>? actions,
    PreferredSizeWidget? bottom,
    bool? center,
    Widget? titleWidget,
    double? elevation,
    Widget? backWidget}) {
  return AppBar(
    title: titleWidget ??
        Text(title, style: boldTextStyle(color: whiteColor, size: 18)),
    flexibleSpace: const AppBarGradientWidget(),
    actions: actions,
    centerTitle: center,
    leading: backWidget,
    bottom: bottom,
    automaticallyImplyLeading: false,
    elevation: elevation,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

class AppBarGradientWidget extends StatelessWidget {
  const AppBarGradientWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor1,
            primaryColor2,
          ],
        ),
      ),
      child: child,
    );
  }
}
