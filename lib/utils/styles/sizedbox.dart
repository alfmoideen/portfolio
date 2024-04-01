import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox get space {
  return const SizedBox();
}

extension Height on SizedBox {
  SizedBox h(double value) => SizedBox(height: value);
}

extension Width on SizedBox {
  SizedBox w(double value) => SizedBox(width: value);
}

extension StaticWidth on SizedBox {
  SizedBox get w4 => SizedBox(width: 4.w);

  SizedBox get w8 => SizedBox(width: 8.w);

  SizedBox get w12 => SizedBox(width: 12.w);

  SizedBox get w16 => SizedBox(width: 16.w);

  SizedBox get w24 => SizedBox(width: 24.w);
}

extension StaticHeigh on SizedBox {
  SizedBox get h4 => SizedBox(height: 4.w);
  SizedBox get hh4 => SizedBox(height: 8.h);

  SizedBox get h8 => SizedBox(height: 8.w);
  SizedBox get hh8 => SizedBox(height: 16.h);

  SizedBox get h12 => SizedBox(height: 12.w);
  SizedBox get hh12 => SizedBox(height: 24.h);

  SizedBox get h14 => SizedBox(height: 14.w);
  SizedBox get hh14 => SizedBox(height: 28.h);

  SizedBox get h24 => SizedBox(height: 24.w);
  SizedBox get hh24 => SizedBox(height: 48.h);

  SizedBox get h28 => SizedBox(height: 28.w);
  SizedBox get hh28 => SizedBox(height: 56.h);

  SizedBox get h18 => SizedBox(height: 18.w);
  SizedBox get hh18 => SizedBox(height: 36.h);

  SizedBox get h16 => SizedBox(height: 16.w);
  SizedBox get hh16 => SizedBox(height: 32.h);

  SizedBox get h32 => SizedBox(height: 32.w);
  SizedBox get hh32 => SizedBox(height: 64.h);
}

extension StringExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
