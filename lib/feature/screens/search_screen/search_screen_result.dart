import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/style/text_style.dart';
import 'package:news/feature/cubit/newscubit_cubit.dart';
import 'package:news/feature/cubit/newscubit_state.dart';
import '../../../core/constants/constatant.dart';
import '../../../core/model/top_headline_model.dart';
import '../../../core/style/app_color.dart';
import '../../service/search_screen_service.dart';
import '../article/article_screen.dart';
import '../home_screens/widgets/Article_items.dart';

class SearchScreenResult extends StatelessWidget {
  final String title;
  const SearchScreenResult({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        title: Text(title.tr()),
        centerTitle: true,
        titleTextStyle: TextStyleApp.black25semibold,
        toolbarHeight: 90.h,
        actions: [
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
      body: BlocBuilder<NewsCubit,NewsState>(
          builder: (context, state) {

            if(state is NewsLoading){
              return Center(child: CircularProgressIndicator(),);
            }

          else if(state is NewsError){
            return Center(child: Text("Error is : ${state.error}"),);
            }


          else if(state is NewsSuccessed){
              TopHeadLinesModel topHeadLinesModel = state.topHeadLinesModel;

              if (topHeadLinesModel.totalResults == 0) {
                return Center(
                  child: Text("no_results".tr()),
                );
              }

              return Column(
                children: [
                  const SizedBox(height: 16),
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

            else { Center(child: Text("Error no at State"),);}

            return Center();
          }

      ),


    );
  }
}
