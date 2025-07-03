import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/model/top_headline_model.dart';

import '../../../../core/style/text_style.dart';

class ArticleItems extends StatelessWidget {
  final Article article;
  const ArticleItems({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: SizedBox(
        width: double.infinity,
        height: 110.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Text("${article.title}",
                      style: TextStyleApp.black18semibold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 238.w,
                  child: Text(
                      "${article.author} . ${DateFormat('yyyy-MM-dd – kk:mm').format(article.publishedAt ?? DateTime.now())}",
                      style: TextStyleApp.grey12semibold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ),
              ],
            ),
            SizedBox(
              height: 80.h,
              width: 112.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ??
                      "https://pbs.twimg.com/media/EUwoEjMXgAEvpp1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
