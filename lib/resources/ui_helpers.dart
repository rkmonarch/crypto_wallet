import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

Widget hSpaceTiny(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.001);
Widget hSpaceSmall(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.01);
Widget hSpaceMedium(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.03);
Widget hSpaceLarge(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.05);
Widget hSpaceMassive(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.1);

Widget vSpaceTiny(BuildContext context) =>
    SizedBox(height: deviceHeight(context) * 0.001);
Widget vSpaceSmall(BuildContext context) =>
    SizedBox(height: deviceHeight(context) * 0.01);
Widget vSpaceMedium(BuildContext context) =>
    SizedBox(height: deviceHeight(context) * 0.03);
Widget vSpaceLarge(BuildContext context) =>
    SizedBox(height: deviceHeight(context) * 0.05);
Widget vSpaceMassive(BuildContext context) =>
    SizedBox(height: deviceHeight(context) * 0.1);

Widget verticalSpace(double height) => SizedBox(height: height);

extension CustomContext on BuildContext {
  double deviceHeight({double percent = 1}) =>
      MediaQuery.of(this).size.height * percent;

  double deviceWidth({double percent = 1}) =>
      MediaQuery.of(this).size.width * percent;
}

Widget emptyBox() => const SizedBox.shrink();

// Screen Size helpers
Logger lg = Logger();
