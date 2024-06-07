import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onValueChanged;

  const FilterItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onValueChanged,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: const Color(0xFFFF708A),
                side: const BorderSide(color: Color(0xFFFF708A), width: 2),
                value: isSelected,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                onChanged: (bool? value) {
                  if (value == true) {
                    onValueChanged();
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
