import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/gold/presentation/widgets/custom_expansion_list.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<Map<String, dynamic>> _items = List.generate(20, (index) {
    return {
      'id': index,
      'title': 'Item $index',
      'description':
          'This is the description of the item $index. There is nothing important here. In fact, it is meaningless.',
      'isExpanded': false,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackNorColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 60.0.h),
          child: CustomExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                _items[index]['isExpanded'] = !isExpanded;
              });
            },
            children: _items.map(
              (item) {
                return ExpansionPanel(
                  canTapOnHeader: true,
                  backgroundColor: AppColors.kGreyBehindColor,
                  headerBuilder: (_, isExpanded) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 15.0.h,
                        bottom: 15.0.h,
                        left: 16.0.w,
                      ),
                      child: Text(
                        item['title'],
                        style: AppStyles.style16Bold.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    );
                  },
                  body: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 15.0.h,
                    ),
                    child: Text(
                      item['description'],
                      style: AppStyles.style16Bold.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                  isExpanded: item['isExpanded'],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
