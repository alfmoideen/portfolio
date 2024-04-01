// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/styles/colors.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation1;
  late AnimationController _controller1;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
    _controller1.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
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
      ),
    );
  }

  Widget returnBody({required bool isMobile}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isMobile
              ? ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                      ], // Your gradient colors
                    ).createShader(bounds);
                  },
                  child: Text(
                    'About Me',
                    style: tn.inter.s16.white.w5.h(1),
                  ),
                )
              : Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.grey,
                        ], // Your gradient colors
                      ).createShader(bounds);
                    },
                    child: Text(
                      'About Me',
                      style: tn.inter.s8.white.w5.h(1),
                    ),
                  ),
                ),
          space.h8,
          SlideTransition(
            position: _offsetAnimation1,
            child: Text(
              '\t\t\t\t\t\tWelcome! I\'m a passionate Flutter developer with over 3 years of experience and a total of 7 years in IT. Specializing in crafting dynamic mobile applications, I thrive on blending functionality with aesthetics. I\'m committed to delivering high-quality solutions that exceed client expectations, staying updated with the latest industry trends. Let\'s bring your ideas to life together',
              style: isMobile ? tn.inter.s12.grey1.w5 : tn.inter.s6.grey1.w5,
            ),
          ),
          space.h4,
          Row(
            children: [
              if (!isMobile) const Spacer(),
              SlideTransition(
                position: _offsetAnimation,
                child: InkWell(
                  onTap: () async {
                    String url =
                        'https://firebasestorage.googleapis.com/v0/b/portfolio-5768b.appspot.com/o/porfolio%2FAlthafVM_CV.pdf?alt=media&token=6362c61a-305e-4b35-add7-c462f655167a';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Resume',
                        style: isMobile
                            ? tn.inter.s13.blueClr.w5.h(1)
                            : tn.inter.s5.blueClr.w5.h(1),
                      ),
                      Icon(
                        Icons.launch,
                        color: blueColor,
                        size: isMobile ? 11.sp : 5.sp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
