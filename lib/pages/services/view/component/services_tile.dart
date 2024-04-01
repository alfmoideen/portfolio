import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';

class ServiceToolTile extends StatefulWidget {
  const ServiceToolTile({
    super.key,
    required this.image,
    required this.name,
    required this.appstorePressed,
    required this.playstorePressed,
    this.isMobile = false,
  });
  final String image;
  final String name;
  final VoidCallback playstorePressed;
  final VoidCallback appstorePressed;
  final bool isMobile;

  @override
  State<ServiceToolTile> createState() => _ServiceToolTileState();
}

class _ServiceToolTileState extends State<ServiceToolTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return widget.isMobile
        ? MouseRegion(
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
              padding: EdgeInsets.symmetric(
                vertical: 10.sp,
                horizontal: 15.sp,
              ),
              width: 180.sp,
              margin: EdgeInsets.all(7.5.sp),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                    child: SvgPicture.asset(
                      widget.image,
                      height: 50.sp,
                    ),
                  ),
                  space.w12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: tn.inter.grey10.s14.w5,
                      ),
                      InkWell(
                        onTap: widget.playstorePressed,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              SvgAssets.playstore,
                              height: 14.sp,
                            ),
                            space.w4,
                            Text(
                              'PlayStore',
                              style: tn.inter.white.s8.w5,
                            ),
                          ],
                        ),
                      ),
                      space.h4,
                      InkWell(
                        onTap: widget.appstorePressed,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              SvgAssets.appstore,
                              height: 14.sp,
                            ),
                            space.w4,
                            Text(
                              'AppStore',
                              style: tn.inter.white.s8.w5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
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
                      transform: Matrix4.identity()..scale(isHover ? 1.4 : 1.0),
                      transformAlignment: Alignment.center,
                      height: 45.sp,
                      width: 45.sp,
                      padding: const EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(
                          horizontal: isHover ? 10.w : 5.w),
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
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
                          height: 8.sp,
                        ),
                      ),
                    ),
                  ),
                  if (isHover)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            child: MouseRegion(
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
                                onTap: widget.playstorePressed,
                                child: Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    SvgAssets.playstore,
                                    height: 8.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          space.w4,
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
                            child: InkWell(
                              onTap: widget.appstorePressed,
                              child: Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: SvgPicture.asset(
                                  SvgAssets.appstore,
                                  height: 8.sp,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isHover ? 12.w : 8.w,
              ),
              Text(
                widget.name,
                style: tn.inter.grey10.s6.w5,
              ),
            ],
          );
  }
}
