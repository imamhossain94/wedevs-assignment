import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DokanIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const DokanIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white, // Button color
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.grey, // Splash color
        onTap: onPressed,
        child: SizedBox(width: 50.h, height: 50.h, child: Center(child: icon)),
      ),
    );
  }
}
