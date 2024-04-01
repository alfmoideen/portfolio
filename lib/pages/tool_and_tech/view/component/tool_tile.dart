import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/text_styles.dart';

class ToolTile extends StatefulWidget {
  const ToolTile({
    super.key,
    required this.image,
    required this.name,
    this.isMobile = false,
  });
  final String image;
  final String name;
  final bool isMobile;

  @override
  State<ToolTile> createState() => _ToolTileState();
}

class _ToolTileState extends State<ToolTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()..scale(isHover ? 1.2 : 1.0),
            transformAlignment: Alignment.center,
            height: widget.isMobile ? 75.sp : 50.sp,
            width: widget.isMobile ? 75.sp : 50.sp,
            margin: EdgeInsets.symmetric(horizontal: isHover ? 10.w : 5.w),
            padding: const EdgeInsets.all(20),
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
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SvgPicture.asset(
                widget.image,
                height: 35.sp,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isHover ? 12.w : 8.w,
        ),
        Text(
          widget.name,
          style:
              widget.isMobile ? tn.inter.grey10.s12.w5 : tn.inter.grey10.s6.w5,
        ),
      ],
    );
  }
}
