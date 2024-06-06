import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DokanTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hint;
  final bool isPassword;
  final bool eyeVisibility;

  const DokanTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    required this.isPassword,
    required this.eyeVisibility,
  });

  @override
  State<DokanTextField> createState() => _DokanTextFieldState();
}

class _DokanTextFieldState extends State<DokanTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.5.h),
      // Use symmetric padding
      margin: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 6.w),
      // height: 7.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.black,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        obscureText: _isPasswordVisible,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
          prefixIcon: widget.icon,
          suffixIcon: widget.isPassword && widget.eyeVisibility
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 18.sp,
                    color: const Color(0xFF7C8592),
                  ),
                )
              : null,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: const Color(0xFF7C8592),
            fontSize: 14.sp,
            fontFamily: "Roboto",
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
      ),
    );
  }
}
