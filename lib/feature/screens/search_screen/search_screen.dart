import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/main.dart';

import '../../../core/model/top_headline_model.dart';
import '../../service/search_screen_service.dart';
import '../../service/service.dart';
import '../article/article_screen.dart';
import '../home_screens/widgets/Article_items.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
            onPressed: () {
              query = "";
            },
            icon: Icon(Icons.cancel))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("results".tr());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return FutureBuilder(
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

            return Expanded(
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
            );
          }

          return const Center(
            child: Text("Something went wrong"),
          );
        },
      );
    } else {
      return FutureBuilder(
        future: SearchScreenService.getSearchResult(query),
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

            return Expanded(
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
            );
          }

          return const Center(
            child: Text("Something went wrong"),
          );
        },
      );
    }
  }
}
