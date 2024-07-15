import 'package:event_spotter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget commonButton({double? width, String? btnText}) {
  return Container(
    width: width,
    height: 50,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(8),
    decoration: boxDecorationRoundedWithShadow(
      24,
      gradient: const LinearGradient(
        colors: [
          primaryColor1,
          primaryColor2,
        ],
      ),
    ),
    child: Text(btnText!.toUpperCase(),
        style: boldTextStyle(color: white), textAlign: TextAlign.center),
  );
}
