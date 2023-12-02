import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionPanel extends StatelessWidget {
  const CustomExpansionPanel({
    super.key,
    required this.headerBuilder,
    required this.body,
    this.isExpanded = false,
    this.canTapOnHeader = false,
    this.backgroundColor,
  });

  final ExpansionPanelHeaderBuilder headerBuilder;
  final Widget body;
  final bool isExpanded;
  final bool canTapOnHeader;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
