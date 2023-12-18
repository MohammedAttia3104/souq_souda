import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_souda/article/presentation/screens/article_body.dart';
import 'package:souq_souda/article/presentation/widgets/article_notification_tab_bar.dart';
import 'package:souq_souda/core/constants/app_strings.dart';
import 'package:souq_souda/core/constants/app_styles.dart';

class AllNotificationScreen extends StatelessWidget {
  const AllNotificationScreen({super.key});

  TabBar get _tabs {
    return const TabBar(
      tabs: [
        Text(AppStrings.notification),
        Text(AppStrings.articles),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            toolbarHeight: 106.0.h,
            centerTitle: true,
            title: Text(
              AppStrings.notification,
              style: AppStyles.style18Bold,
            ),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: _tabs.preferredSize,
              child: const ArticleNotificationTabBar(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 24.0.h),
            child: const TabBarView(
              children: [
                Column(),
                ArticleBody(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
