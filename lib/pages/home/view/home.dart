import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<Offset> _offsetAnimation1;
  late Animation<Offset> _offsetAnimation2;
  late Animation<Offset> _offsetAnimation3;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInOut,
    ));
    _offsetAnimation3 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
    _controller1.forward();
    _controller2.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children: [
              const Spacer(),
              returnBody(isMobile: true),
              const Spacer(),
            ],
          );
        } else {
          return Column(
            children: [
              const Spacer(),
              returnBody(isMobile: false),
              const Spacer(),
            ],
          );
        }
      },
    );
  }

  Widget returnBody({required bool isMobile}) {
    return isMobile
        ? SingleChildScrollView(
            child: Row(
              children: [
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          PngAssets.profileImage2,
                          // height: 500.h,
                          height: MediaQuery.of(context).size.height * 0.60,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SlideTransition(
                      position: _offsetAnimation1,
                      child: Text(
                        'Welcome to my Portfolio',
                        style: tn.inter.s13.grey1.w5.h(1),
                      ),
                    ),
                    space.h4,
                    SlideTransition(
                      position: _offsetAnimation2,
                      child: Text(
                        'Althaf Moideen',
                        style: tn.inter.s20.white.w5.h(1),
                      ),
                    ),
                    space.h4,
                    SlideTransition(
                      position: _offsetAnimation3,
                      child: Text(
                        'Flutter Developer',
                        style: tn.inter.s13.grey1.w5.h(1),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        : Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    PngAssets.profileImage2,
                    height: 500.h,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: Text(
                      'Welcome to my Portfolio',
                      style: tn.inter.s8.grey1.w5.h(1),
                    ),
                  ),
                  space.h4,
                  SlideTransition(
                    position: _offsetAnimation2,
                    child: Text(
                      'Althaf Moideen',
                      style: tn.inter.s15.white.w5.h(1),
                    ),
                  ),
                  space.h4,
                  SlideTransition(
                    position: _offsetAnimation3,
                    child: Text(
                      'Flutter Developer',
                      style: tn.inter.s8.grey1.w5.h(1),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
