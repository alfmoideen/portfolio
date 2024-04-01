import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles/colors.dart';

TextStyle get tn4 {
  return GoogleFonts.inter(fontWeight: FontWeight.w400, color: drkGrey);
}

TextStyle get tn {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w500, color: drkGrey, fontSize: 12.sp);
}

TextStyle get tns6 {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, color: drkGrey, fontSize: 12.sp);
}

TextStyle get tns7 {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w700, color: drkGrey, fontSize: 12.sp);
}

extension FontSizes on TextStyle {
  TextStyle s(double value) => copyWith(fontSize: value.sp);
  TextStyle get s1 => copyWith(fontSize: 1.sp);
  TextStyle get s2 => copyWith(fontSize: 2.sp);
  TextStyle get s3 => copyWith(fontSize: 3.sp);
  TextStyle get s4 => copyWith(fontSize: 4.sp);
  TextStyle get s5 => copyWith(fontSize: 5.sp);
  TextStyle get s6 => copyWith(fontSize: 6.sp);
  TextStyle get s7 => copyWith(fontSize: 7.sp);
  TextStyle get s8 => copyWith(fontSize: 8.sp);
  TextStyle get s9 => copyWith(fontSize: 9.sp);
  TextStyle get s10 => copyWith(fontSize: 10.sp);

  TextStyle get s11 => copyWith(fontSize: 11.sp);

  TextStyle get s12 => copyWith(fontSize: 12.sp);

  TextStyle get s13 => copyWith(fontSize: 13.sp);

  TextStyle get s15 => copyWith(fontSize: 15.sp);

  TextStyle get s14 => copyWith(fontSize: 14.sp);

  TextStyle get s16 => copyWith(fontSize: 16.sp);
  TextStyle get s17 => copyWith(fontSize: 17.sp);

  TextStyle get s18 => copyWith(fontSize: 18.sp);

  TextStyle get s20 => copyWith(fontSize: 20.sp);

  TextStyle get s22 => copyWith(fontSize: 22.sp);
  TextStyle get s24 => copyWith(fontSize: 24.sp);
  TextStyle get s28 => copyWith(fontSize: 28.sp);
  TextStyle get s32 => copyWith(fontSize: 32.sp);
  TextStyle get s34 => copyWith(fontSize: 34.sp);
  TextStyle get s36 => copyWith(fontSize: 36.sp);
  TextStyle get s40 => copyWith(fontSize: 40.sp);
  TextStyle get s42 => copyWith(fontSize: 42.sp);
  TextStyle get s64 => copyWith(fontSize: 64.sp);
}

extension FontWeights on TextStyle {
  TextStyle get n => copyWith(fontWeight: FontWeight.normal);

  TextStyle get w1 => copyWith(fontWeight: FontWeight.w100);

  TextStyle get w2 => copyWith(fontWeight: FontWeight.w200);

  TextStyle get w3 => copyWith(fontWeight: FontWeight.w300);

  TextStyle get w4 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get w5 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get w6 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get w7 => copyWith(fontWeight: FontWeight.w700);

  TextStyle get w8 => copyWith(fontWeight: FontWeight.w800);

  TextStyle get w9 => copyWith(fontWeight: FontWeight.w900);
}

extension Height on TextStyle {
  TextStyle h(double value) => copyWith(height: value);
}

extension FontStyles on TextStyle {
  TextStyle get b => copyWith(fontWeight: FontWeight.bold);

  TextStyle get u => copyWith(decoration: TextDecoration.underline);

  TextStyle get o => copyWith(decoration: TextDecoration.overline);

  TextStyle get i => copyWith(fontStyle: FontStyle.italic);

  TextStyle get lt => copyWith(decoration: TextDecoration.lineThrough);
}

extension TextColor on TextStyle {
  TextStyle c(int? color) => copyWith(color: Color(color!));

  TextStyle cl(Color? color) => copyWith(color: color);

  // TextStyle get primaryText => copyWith(color: ColorConstants.primaryBrandColor);
  //
  // TextStyle get white => copyWith(color: ColorConstants.inverseTextColor);

  TextStyle get blueClr => copyWith(color: blueColor);
  TextStyle get blueClr2 => copyWith(color: const Color(0xff007AFF));

  TextStyle get blue900 => copyWith(color: const Color(0XFF0CB8ED));

  TextStyle get blueClr3 => copyWith(color: blueColor.withOpacity(.3));

  TextStyle get dGrey => copyWith(color: drkGrey);

  TextStyle get orng => copyWith(color: orngClr);
  TextStyle get black => copyWith(color: const Color(0XFF221F20));

  TextStyle get dGrey5 =>
      copyWith(color: const Color(0xFF414042).withOpacity(.5));
  TextStyle get dGrey8 => copyWith(color: const Color(0xFF414042));

  TextStyle get dGrey7 =>
      copyWith(color: const Color(0xFF414042).withOpacity(.7));
  TextStyle get dGrey900 => copyWith(color: const Color(0xFF414042));

  TextStyle get dGrey700 => copyWith(color: const Color(0xFF676668));
  TextStyle get dGrey500 => copyWith(color: const Color(0xFF8D8C8E));
  TextStyle get dGrey300 => copyWith(color: const Color(0xffB3B3B3));
  TextStyle get buttonGrey => copyWith(color: const Color(0xffE6E6E7));
  TextStyle get darkGrey3 => copyWith(color: const Color(0xff8D8C8E));
  TextStyle get darkGrey4 => copyWith(color: const Color(0xffC6C6C8));
  TextStyle get darkGrey6 => copyWith(color: const Color(0xff6B6B6B));

  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get red => copyWith(color: const Color(0xffEB5757));
  TextStyle get deepRed => copyWith(color: const Color(0xffEE564C));
  TextStyle get lightBlack => copyWith(color: const Color(0xff272C44));
  TextStyle get semiLightBlack => copyWith(color: const Color(0xff92949D));
  TextStyle get brightBlue => copyWith(color: const Color(0xff0CB8ED));
  TextStyle get brightGrey => copyWith(color: const Color(0xffA6A6A6));
  TextStyle get semiBlack => copyWith(color: const Color(0xff221F20));
  TextStyle get darkGrey5 => copyWith(color: const Color(0xffE2E2E1));
  TextStyle get brightRed => copyWith(color: const Color(0xffF91515));
  TextStyle get dGrey9 => copyWith(color: const Color(0xffD9D9D9));
  TextStyle get blueShade =>
      copyWith(color: const Color(0xff0CB8ED).withOpacity(.16));
  TextStyle get orange => copyWith(color: const Color(0xffF98715));
  TextStyle get orangeShade =>
      copyWith(color: const Color(0xffF98715).withOpacity(.16));
  TextStyle get lightblue =>
      copyWith(color: const Color(0xff6BCDEB).withOpacity(.16));
  TextStyle get darkblue => copyWith(color: const Color(0xff037092));
  TextStyle get grey10 => copyWith(color: const Color(0xff898989));
  TextStyle get grey1 => copyWith(color: const Color(0xff75797E));
  TextStyle get grey2 => copyWith(color: const Color(0xff595959));
  TextStyle get grey3 => copyWith(color: const Color(0xffF5F5F5));
  TextStyle get grey4 => copyWith(color: const Color(0xff888888));
  TextStyle get grey6 => copyWith(color: const Color(0xffBFBFBF));
  TextStyle get grey7 => copyWith(color: const Color(0xff8C8C8C));
  TextStyle get grey9 => copyWith(color: const Color(0xff434343));
  TextStyle get green2 => copyWith(color: const Color(0xff3DCB74));
  TextStyle get white2 => copyWith(color: const Color(0xffF0F0F0));
  TextStyle get purple => copyWith(color: const Color(0xff8A61FF));
  TextStyle get green => copyWith(color: const Color(0xffBBF246));
  TextStyle get grey13 => copyWith(color: const Color(0xff101010));
  TextStyle get cyan => copyWith(color: const Color(0xff75E6EC));
  TextStyle get grey14 => copyWith(color: const Color(0xff434343));
  TextStyle get purple2 => copyWith(color: const Color(0xffEA3D71));
  TextStyle get green3 => copyWith(color: const Color(0xff52C41A));
  TextStyle get red2 => copyWith(color: const Color(0xffFF5757));
  TextStyle get grey8 => copyWith(color: const Color(0xff2A2A2A));
  TextStyle get grey11 => copyWith(color: const Color(0xffFAFAFA));
  TextStyle get grey12 => copyWith(color: const Color(0xff1F1F1F));
  TextStyle get red3 => copyWith(color: const Color(0xffE53B30));
  TextStyle get red4 => copyWith(color: const Color(0xffF5222D));
}

extension FontFamily on TextStyle {
  TextStyle get inter => copyWith(fontFamily: "Inter");
}
