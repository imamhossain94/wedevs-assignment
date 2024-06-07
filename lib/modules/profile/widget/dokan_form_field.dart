import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DokanFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;

  const DokanFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: const Color(0xFF858C90),
                fontSize: 14.sp,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: title == "Zip Code" ? 100 : null,
            child: TextField(
              controller: controller,
              autocorrect: true,
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xFFE5E6E7), width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}
