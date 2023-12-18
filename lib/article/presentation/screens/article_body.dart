// ignore_for_file: iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:souq_souda/article/presentation/controllers/article/article_cubit.dart';
import 'package:souq_souda/core/constants/app_colors.dart';
import 'package:souq_souda/core/constants/app_styles.dart';
import 'package:souq_souda/core/constants/size_config.dart';
import 'package:souq_souda/core/networks/api_constants.dart';
import 'package:souq_souda/core/widgets/cached_image.dart';
import 'package:souq_souda/core/widgets/circular_indicator.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        // Navigator.pushNamed(context, );
      },
      builder: (context, state) {
        if (state is ArticleLoadingState) {
          return CircularIndicator(height: 400.0.h);
        }
        if (state is ArticleSuccessState) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.padding24w,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                DateTime apiDate =
                    DateTime.parse(state.articles[index].createdAt);
                String formattedDate =
                    DateFormat('dd MMM yyyy').format(apiDate);
                String formattedTime = DateFormat('HH:mm a').format(apiDate);
                // if (DateTime.parse(state.articles[index].createdAt).day ==
                //     DateTime.parse(state.articles[index + 1].createdAt).day) {
                //   return Container(
                //     color: AppColors.kGreyColor,
                //     width: double.infinity,
                //     height: 30.0.h,
                //     alignment: Alignment.center,
                //     child: Text(
                //       formattedDate,
                //       style: AppStyles.style14Bold,
                //     ),
                //   );
                // }
                return Column(
                  children: [
                    Container(
                      color: AppColors.kGreyColor,
                      width: double.infinity,
                      height: 30.0.h,
                      alignment: Alignment.center,
                      child: Text(
                        formattedDate,
                        style: AppStyles.style14Bold,
                      ),
                    ),
                    SizedBox(
                      height: AppPadding.padding14h,
                    ),
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                6.0.r,
                              ),
                            ),
                          ),
                          child: CachedImage(
                            imagePath: ApiConstants.storageUrl(
                              state.articles[index].thumbnail,
                            ),
                            height: 45.0.h,
                            width: 45.0.w,
                          ),
                        ),
                        SizedBox(
                          width: AppPadding.padding8w,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.articles[index].title,
                                style: AppStyles.style14Bold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    formattedTime,
                                    style: AppStyles.style12Bold.copyWith(
                                      color: AppColors.kYellowNorColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppPadding.padding4w,
                                  ),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: AppColors.kYellowNorColor,
                                    size: 20.0.r,
                                  ),
                                ],
                              ),
                              Text(
                                state.articles[index].shortDescription,
                                style: AppStyles.style12Bold.copyWith(
                                  color: AppColors.kGreySubTitleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppPadding.padding8h,
                );
              },
              itemCount: 10,
            ),
          );
        }
        return CircularIndicator(height: 400.0.h);
      },
    );
  }
}
