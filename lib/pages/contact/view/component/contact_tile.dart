// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/styles/colors.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';

class ContactTile extends StatefulWidget {
  const ContactTile({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
    required this.tapFunction,
    this.isMobile = false,
  });
  final String title;
  final Widget subTitle;
  final String image;
  final VoidCallback tapFunction;
  final bool isMobile;

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: InkWell(
        onTap: widget.tapFunction,
        child: Container(
          width: widget.isMobile ? 105.sp : 75.sp,
          height: widget.isMobile ? 105.sp : 75.sp,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? Colors.white.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: isHover ? 7 : 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.image,
                color: grey2,
                height: widget.isMobile ? 50.sp : 30.sp,
              ),
              space.hh4,
              Text(
                widget.title,
                style: widget.isMobile
                    ? tn.inter.white.s10.w6.h(1)
                    : tn.inter.white.s6.w6.h(1),
                textAlign: TextAlign.center,
              ),
              space.hh4,
              widget.subTitle,
            ],
          ),
        ),
      ),
    );
  }
}
