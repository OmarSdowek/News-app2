import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/model/top_headline_model.dart';
import 'package:news/core/style/app_color.dart';
import 'package:news/core/style/text_style.dart';
import 'package:news/feature/screens/article/article_screen.dart';
import 'package:news/feature/screens/home_screens/widgets/Article_items.dart';
import 'package:news/feature/screens/home_screens/widgets/custom_category_item.dart';
import 'package:news/feature/screens/home_screens/widgets/top_headline_items.dart';
import 'package:news/feature/screens/search_screen/search_screen.dart';
import 'package:news/feature/screens/search_screen/search_screen_result.dart';
import '../../../core/constants/constatant.dart';
import '../../service/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        title: Text(
          "explore".tr(),
          style: TextStyleApp.black32semibold,
        ),
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
                context.setLocale(Locale("ar"));
              } else {
                context.setLocale(Locale("en"));
              }
              Constatant.lan = context.locale.languageCode;
            },
            padding: EdgeInsets.only(right: 20.w),
            iconSize: 35.sp,
          )
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenService.getTopHeadLineArticle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData) {
            TopHeadLinesModel topHeadLinesModel =
                snapshot.data! as TopHeadLinesModel;

            if (topHeadLinesModel.totalResults == 0) {
              return Center(
                child: Text("no_results".tr()),
              );
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
                        CustomCategoryItem(
                          title: "travel".tr(),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SearchScreenResult(title: "travel"),
                            ));
                          },
                        ),
                        CustomCategoryItem(
                          title: "technology".tr(),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return SearchScreenResult(
                                  title: "technology",
                                );
                              },
                            ));
                          },
                        ),
                        CustomCategoryItem(
                          title: "business".tr(),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return SearchScreenResult(
                                  title: "business",
                                );
                              },
                            ));
                          },
                        ),
                        CustomCategoryItem(
                          title: "entertainment".tr(),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return SearchScreenResult(
                                  title: "entertainment",
                                );
                              },
                            ));
                          },
                        ),
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
                    child: Column(
                      children: [
                        TopHeadlineItems(
                          article: topHeadLinesModel.articles![0],
                        )
                      ],
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
                        Article article = topHeadLinesModel.articles![index];

                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ArticleScreen(
                                article: article,
                              ),
                            ));
                          },
                          child: ArticleItems(
                            article: article,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }
}
