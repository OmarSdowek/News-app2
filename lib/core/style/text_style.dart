import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/style/app_color.dart';

class TextStyleApp {
  static final TextStyle black18semibold = GoogleFonts.inter(
      fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColor().primeryColor
  ) ;
  static final TextStyle black18semiboldm = GoogleFonts.merriweather(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColor().primeryColor
  ) ;
  static final TextStyle black19semibold = GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColor().primeryColor
  ) ;
  static final TextStyle black32semibold = GoogleFonts.inter(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: AppColor().primeryColor
  ) ;
  static final TextStyle black25semibold = GoogleFonts.inter(
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
      color: AppColor().primeryColor
  ) ;
  static final TextStyle black14semibold = GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColor().primeryColor
  ) ;
  static final TextStyle grey14semibold = GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColor().grey
  ) ;
  static final TextStyle grey12semibold = GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor().grey
  ) ;

}