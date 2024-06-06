import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        child: SizedBox(width: 7.h, height: 7.h, child: Center(child: icon)),
      ),
    );
  }
}
