import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/model/top_headline_model.dart';
import 'package:news/core/style/app_color.dart';
import 'package:news/core/style/text_style.dart';
import 'package:news/feature/cubit/newscubit_state.dart';
import 'package:news/feature/screens/article/article_screen.dart';
import 'package:news/feature/screens/home_screens/widgets/Article_items.dart';
import 'package:news/feature/screens/home_screens/widgets/custom_category_item.dart';
import 'package:news/feature/screens/home_screens/widgets/top_headline_items.dart';
import 'package:news/feature/screens/search_screen/search_screen.dart';
import 'package:news/feature/screens/search_screen/search_screen_result.dart';
import '../../../core/constants/constatant.dart';
import '../../cubit/newscubit_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit()..fetchTopHeadlines(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffE9EEFA),
          title: Text("explore".tr(), style: TextStyleApp.black32semibold),
          toolbarHeight: 120.h,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: AppColor().primeryColor,
              onPressed: () {
                showSearch(context: context, delegate: SearchScreen());
              },
              padding: EdgeInsets.only(right: 20.w),
              iconSize: 35.sp,
            ),
            IconButton(
              tooltip: "language(en-ar)",
              icon: const Icon(Icons.language),
              color: AppColor().primeryColor,
              onPressed: () {
                if (context.locale.languageCode == "en") {
                  context.setLocale(const Locale("ar"));
                } else {
                  context.setLocale(const Locale("en"));
                }
                Constatant.lan = context.locale.languageCode;
              },
              padding: EdgeInsets.only(right: 20.w),
              iconSize: 35.sp,
            )
          ],
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsSuccessed) {
              TopHeadLinesModel topHeadLinesModel = state.topHeadLinesModel;

              if (topHeadLinesModel.totalResults == 0) {
                return Center(child: Text("no_results".tr()));
              }

              return Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 32.w),
                    child: SizedBox(
                      height: 40.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildCategoryItem(context, "travel"),
                          _buildCategoryItem(context, "technology"),
                          _buildCategoryItem(context, "business"),
                          _buildCategoryItem(context, "entertainment"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ArticleScreen(
                            article: topHeadLinesModel.articles![0],
                          ),
                        ));
                      },
                      child: TopHeadlineItems(
                        article: topHeadLinesModel.articles![0],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ListView.builder(
                        itemCount: topHeadLinesModel.articles!.length,
                        itemBuilder: (context, index) {
                          final article = topHeadLinesModel.articles![index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ArticleScreen(article: article),
                              ));
                            },
                            child: ArticleItems(article: article),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.toString()));
            }
            return const Center(child: Text("error"));
          },
        ),
      ),
    );
  }
  Widget _buildCategoryItem(BuildContext context, String category) {
    return CustomCategoryItem(
      title: category.tr(),
      onTap: () {
        final cubit = context.read<NewsCubit>();
        cubit.fetchSearchData(query: category); // Trigger before navigating

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (newContext) => BlocProvider.value(
              value: cubit,
              child: SearchScreenResult(title: category),
            ),
          ),
        );
      },
    );
  }
}