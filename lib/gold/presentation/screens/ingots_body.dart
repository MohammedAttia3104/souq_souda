import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/gold/presentation/widgets/company_list_view.dart';
import 'package:souq_souda/gold/presentation/widgets/custom_expansion_list.dart';

class IngotsBody extends StatefulWidget {
  const IngotsBody({super.key});

  @override
  State<IngotsBody> createState() => _IngotsBodyState();
}

class _IngotsBodyState extends State<IngotsBody> {
  bool isExpanded = false;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const CompanyListView(),
          SizedBox(
            height: AppPadding.padding24h,
          ),
          CustomExpansionPanelList(
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
        ],
      ),
    );
  }
}
// ExpansionPanelList(
//   elevation: 3,
//   expansionCallback: (index, isExpanded) {
//     setState(() {
//       _items[index]['isExpanded'] = !isExpanded;
//     });
//   },
//   expandIconColor: AppColors.kWhiteColor,
//   dividerColor: AppColors.kWhiteColor,
//   children: _items.map(
//     (item) {
//       return ExpansionPanel(
//         canTapOnHeader: true,
//         backgroundColor: AppColors.kGreyBehindColor,
//         headerBuilder: (_, isExpanded) {
//           return Container(
//             padding: const EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 30,
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.kGreyBehindColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(
//                   10.0.r,
//                 ),
//                 bottomLeft: Radius.circular(
//                   10.0.r,
//                 ),
//               ),
//             ),
//             child: Text(
//               item['title'],
//               style: AppStyles.style18Bold,
//             ),
//           );
//         },
//         body: Container(
//           padding: const EdgeInsets.symmetric(
//             vertical: 15,
//             horizontal: 30,
//           ),
//           child: Text(item['description']),
//         ),
//         isExpanded: item['isExpanded'],
//       );
//     },
//   ).toList(),
// ),
