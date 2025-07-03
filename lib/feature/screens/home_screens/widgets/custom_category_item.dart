import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/style/app_color.dart';
import 'package:news/core/style/text_style.dart';

class CustomCategoryItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomCategoryItem(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        splashColor: Color(0xffE9EEFA),
        child: OutlinedButton(
            // style: OutlinedButton.styleFrom(
            //   side: BorderSide(color: Colors.transparent)
            // ),
            onPressed: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 24.w),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE9EEFA), width: 1),
                borderRadius: BorderRadius.circular(56.r),
                color: Colors.transparent,
              ),
              child: Text(
                title,
                style: TextStyleApp.black14semibold,
              ),
            )),
      ),
    );
  }
}
