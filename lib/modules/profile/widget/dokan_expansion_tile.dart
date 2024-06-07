import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DokanExpansionTile extends StatefulWidget {
  final Widget icon;
  final String title;
  final List<Widget> children;

  const DokanExpansionTile(
      {super.key,
      required this.children,
      required this.icon,
      required this.title});

  @override
  State<DokanExpansionTile> createState() => _DokanExpansionTileState();
}

class _DokanExpansionTileState extends State<DokanExpansionTile> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: ExpansionTile(
        leading: widget.icon,
        trailing: DokanIcon.icon(
            isExpanded ? DokanIcon.arrowRightSQ : DokanIcon.arrowDownSQ,
            size: 14.sp,
            color: const Color(0xFF7C8592)),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = !value;
          });
        },
        title: Text(
          widget.title,
          style: TextStyle(
              color: const Color(0xFF222455),
              fontSize: 16.sp,
              fontFamily: "Roboto",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
