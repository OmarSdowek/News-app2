import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/model/top_headline_model.dart';

import '../../../core/style/text_style.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: 430.w,
              height: 316.h,
              child: CachedNetworkImage(
                imageUrl: "${article.urlToImage}",
                fit: BoxFit.fill,
                height: 316.h,
                width: double.infinity,
              ),
            ),
            Positioned(
                top: 290.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: 430.w,
                    height: 700.h,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24.r)),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 34.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${article.title}",
                            style: TextStyleApp.black19semibold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              width: 238.w,
                              child: Text(
                                  "${article.author} . ${DateFormat('yyyy-MM-dd – kk:mm').format(article.publishedAt ?? DateTime.now())}",
                                  style: TextStyleApp.grey14semibold,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2)),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            "${article.description}",
                            style: TextStyleApp.black18semiboldm,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
