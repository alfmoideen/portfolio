// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/pages/contact/view/component/contact_tile.dart';
import 'package:portfolio/pages/contact/view/component/social_media.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/colors.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> _offsetAnimation1;

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
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _offsetAnimation1 = Tween<Offset>(
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
            return Center(
              child: SingleChildScrollView(
                child: returnBody(isMobile: true),
              ),
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

  returnBody({required bool isMobile}) {
    return Column(
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
                  'Contact',
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
                    'Contact',
                    style: tn.inter.s8.white.w5.h(1),
                  ),
                ),
              ),
        space.h8,
        isMobile
            ? Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: ContactTile(
                          title: "Location",
                          isMobile: true,
                          subTitle: Text(
                            'Kerala,India',
                            style: tn.inter.grey10.s9.w5,
                          ),
                          image: SvgAssets.home,
                          tapFunction: () async {
                            String url =
                                'https://www.google.com/maps?q=10.2277,76.1971';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                      space.w12,
                      SlideTransition(
                        position: _offsetAnimation,
                        child: ContactTile(
                          title: "Phone",
                          isMobile: true,
                          subTitle: Text(
                            '+919567010102',
                            style: tn.inter.grey10.s9.w5,
                          ),
                          image: SvgAssets.call,
                          tapFunction: () async {
                            String url = 'tel:+919567010102';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  space.h14,
                  Row(
                    children: [
                      const Spacer(),
                      SlideTransition(
                        position: _offsetAnimation1,
                        child: ContactTile(
                          title: "Mail",
                          isMobile: true,
                          subTitle: Text(
                            'althafvmalf@gmail.com',
                            style: tn.inter.grey10.s9.w5,
                            maxLines: 1,
                          ),
                          image: SvgAssets.mail,
                          tapFunction: () async {
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'althafvmalf@gmail.com',
                              queryParameters: {
                                'subject': 'Mail through Portfolio',
                                'body': '',
                              },
                            );
                            if (await canLaunch(emailLaunchUri.toString())) {
                              await launch(emailLaunchUri.toString());
                            } else {
                              throw 'Could not launch $emailLaunchUri';
                            }
                          },
                        ),
                      ),
                      space.w12,
                      SlideTransition(
                        position: _offsetAnimation1,
                        child: ContactTile(
                          title: "Social Media",
                          isMobile: true,
                          subTitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SocialMediaIcon(
                                child: SvgPicture.asset(
                                  SvgAssets.linkedIn,
                                  height: 10.sp,
                                  width: 10.sp,
                                  color: grey2,
                                ),
                                onTap: () async {
                                  if (!await launchUrl(
                                    Uri.parse(
                                        'https://www.linkedin.com/in/althaf-moideen-56323b79/'),
                                  )) {
                                    throw Exception('Could not launch');
                                  }
                                },
                              ),
                              SocialMediaIcon(
                                child: SvgPicture.asset(
                                  SvgAssets.git,
                                  height: 10.sp,
                                  width: 10.sp,
                                  color: grey2,
                                ),
                                onTap: () async {
                                  if (!await launchUrl(
                                    Uri.parse('https://github.com/alfmoideen'),
                                  )) {
                                    throw Exception('Could not launch');
                                  }
                                },
                              ),
                              SocialMediaIcon(
                                child: SvgPicture.asset(
                                  SvgAssets.fb,
                                  height: 10.sp,
                                  width: 10.sp,
                                  color: grey2,
                                ),
                                onTap: () async {
                                  if (!await launchUrl(
                                    Uri.parse(
                                        'https://www.facebook.com/althaf.moideen.752?mibextid=ibOpuV'),
                                  )) {
                                    throw Exception('Could not launch');
                                  }
                                },
                              ),
                              SocialMediaIcon(
                                child: SvgPicture.asset(
                                  SvgAssets.insta,
                                  height: 10.sp,
                                  width: 10.sp,
                                  color: grey2,
                                ),
                                onTap: () async {
                                  if (!await launchUrl(
                                    Uri.parse(
                                        'https://www.instagram.com/althaf.moideen?igsh=OGJpOTk0OHNzZWRv&utm_source=qr'),
                                  )) {
                                    throw Exception('Could not launch');
                                  }
                                },
                              ),
                            ],
                          ),
                          image: SvgAssets.socialMedia,
                          tapFunction: () {},
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  const Spacer(),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: ContactTile(
                      title: "Location",
                      subTitle: Text(
                        'Kerala,India',
                        style: tn.inter.grey10.s5.w5,
                      ),
                      image: SvgAssets.home,
                      tapFunction: () async {
                        String url =
                            'https://www.google.com/maps?q=10.2277,76.1971';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ),
                  space.w12,
                  SlideTransition(
                    position: _offsetAnimation,
                    child: ContactTile(
                      title: "Phone",
                      subTitle: Text(
                        '+919567010102',
                        style: tn.inter.grey10.s5.w5,
                      ),
                      image: SvgAssets.call,
                      tapFunction: () async {
                        String url = 'tel:+919567010102';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ),
                  space.w12,
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: ContactTile(
                      title: "Mail",
                      subTitle: Text(
                        'althafvmalf@gmail.com',
                        style: tn.inter.grey10.s5.w5,
                        maxLines: 1,
                      ),
                      image: SvgAssets.mail,
                      tapFunction: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'althafvmalf@gmail.com',
                          queryParameters: {
                            'subject': 'Mail through Portfolio',
                            'body': '',
                          },
                        );
                        if (await canLaunch(emailLaunchUri.toString())) {
                          await launch(emailLaunchUri.toString());
                        } else {
                          throw 'Could not launch $emailLaunchUri';
                        }
                      },
                    ),
                  ),
                  space.w12,
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: ContactTile(
                      title: "Social Media",
                      subTitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SocialMediaIcon(
                            child: SvgPicture.asset(
                              SvgAssets.linkedIn,
                              height: 10.sp,
                              width: 10.sp,
                              color: grey2,
                            ),
                            onTap: () async {
                              if (!await launchUrl(
                                Uri.parse(
                                    'https://www.linkedin.com/in/althaf-moideen-56323b79/'),
                              )) {
                                throw Exception('Could not launch');
                              }
                            },
                          ),
                          SocialMediaIcon(
                            child: SvgPicture.asset(
                              SvgAssets.git,
                              height: 10.sp,
                              width: 10.sp,
                              color: grey2,
                            ),
                            onTap: () async {
                              if (!await launchUrl(
                                Uri.parse('https://github.com/alfmoideen'),
                              )) {
                                throw Exception('Could not launch');
                              }
                            },
                          ),
                          SocialMediaIcon(
                            child: SvgPicture.asset(
                              SvgAssets.fb,
                              height: 10.sp,
                              width: 10.sp,
                              color: grey2,
                            ),
                            onTap: () async {
                              if (!await launchUrl(
                                Uri.parse(
                                    'https://www.facebook.com/althaf.moideen.752?mibextid=ibOpuV'),
                              )) {
                                throw Exception('Could not launch');
                              }
                            },
                          ),
                          SocialMediaIcon(
                            child: SvgPicture.asset(
                              SvgAssets.insta,
                              height: 10.sp,
                              width: 10.sp,
                              color: grey2,
                            ),
                            onTap: () async {
                              if (!await launchUrl(
                                Uri.parse(
                                    'https://www.instagram.com/althaf.moideen?igsh=OGJpOTk0OHNzZWRv&utm_source=qr'),
                              )) {
                                throw Exception('Could not launch');
                              }
                            },
                          ),
                        ],
                      ),
                      image: SvgAssets.socialMedia,
                      tapFunction: () {},
                    ),
                  ),
                  const Spacer(),
                ],
              ),
      ],
    );
  }
}
