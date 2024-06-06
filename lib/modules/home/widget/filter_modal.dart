import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:dokan/modules/home/models/filter_option.dart';
import 'package:dokan/modules/home/widget/dokan_filtere_item_list.dart';

void showFilterModal(BuildContext context, {
  required ValueChanged<FilterOption> onValueChanged,
  required VoidCallback onApply,
  required VoidCallback onCancel,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(8),
        topLeft: Radius.circular(8),
      ),
    ),
    context: context,
    builder: (builder) {
      return Padding(
        padding: EdgeInsets.all(4.w),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                child: SizedBox(
                  width: 15.w,
                  child: Divider(
                    height: 1.h,
                    thickness: 3,
                    color: const Color(0xFFFFD3DD),
                  ),
                ),
              ),
            ),
            Text(
              "Filter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, bottom: 6.h, left: 1.w),
              child: DokanFilterItemList(
                onValueChanged: onValueChanged,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 0.5, color: Color(0xFFD2DBE0)),
                    ),
                    elevation: 0,
                    child: SizedBox(
                      height: 8.h,
                      child: CupertinoButton(
                        onPressed: onCancel,
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: const Color(0xFF818995),
                            fontSize: 14.sp,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 8.h,
                    child: CupertinoButton(
                      onPressed: onApply,
                      padding: EdgeInsets.zero,
                      color: const Color(0xFF1ABC9C),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: "Lato",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
