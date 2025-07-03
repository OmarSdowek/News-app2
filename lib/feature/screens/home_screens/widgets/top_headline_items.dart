import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/model/top_headline_model.dart';
import 'package:news/core/style/text_style.dart';

class TopHeadlineItems extends StatelessWidget {
  final Article article;
  TopHeadlineItems({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: "${article.urlToImage}",
              fit: BoxFit.fill,
              height: 206.h,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "${article.title}",
            style: TextStyleApp.black18semibold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "${article.author} . ${DateFormat('yyyy-MM-dd – kk:mm').format(article.publishedAt ?? DateTime.now())}",
            style: TextStyleApp.grey12semibold,
          ),
        ],
      ),
    );
  }
}
