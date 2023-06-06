import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.height = 50.0,
    this.width = 150,
    this.borderradius = 8,
    this.fontsize = 16,
    this.textcolor = Colors.white,
    this.bordercolor = Colors.white,
    required this.ontap,
    this.color = const Color(0xff110152),
    this.text = "Tap-me",
  }) : super(key: key);

  final double height;
  final double width;
  final VoidCallback ontap;
  final String text;
  final Color color;
  final Color bordercolor;
  final double fontsize;
  final double borderradius;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: ElevatedButton(
          onPressed: ontap,
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(bordercolor),
              foregroundColor: MaterialStateProperty.all(bordercolor),
              overlayColor: MaterialStateProperty.all(bordercolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderradius),
              )),
              minimumSize: MaterialStateProperty.all(Size.fromHeight(width)),
              backgroundColor: MaterialStateProperty.all(color)),
          child: Text(
            text,
            style: TextStyle(
                color: textcolor,
                fontSize: fontsize,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
