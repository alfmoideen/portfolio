import 'package:flutter/material.dart';
import 'package:portfolio/pages/services/view/component/services_tile.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
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
      parent: _controller1,
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
            return Center(
                child:
                    SingleChildScrollView(child: returnBody(isMobile: false)));
          }
        },
      ),
    );
  }

  Widget returnBody({required bool isMobile}) {
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
                  'Projects',
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
                    'Projects',
                    style: tn.inter.s8.white.w5.h(1),
                  ),
                ),
              ),
        space.h8,
        isMobile
            ? Row(
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _offsetAnimation1,
                        child: ServiceToolTile(
                          image: SvgAssets.gangupp,
                          isMobile: true,
                          name: 'Gangupp',
                          appstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://play.google.com/store/apps/details?id=com.gangupp.gangupp'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                          playstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://play.google.com/store/apps/details?id=com.gangupp.gangupp'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                        ),
                      ),
                      SlideTransition(
                        position: _offsetAnimation1,
                        child: ServiceToolTile(
                          image: SvgAssets.pexa,
                          isMobile: true,
                          name: 'Pexa',
                          appstorePressed: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://apps.apple.com/in/app/pexa/id1613868591'))) {
                              throw Exception('Could not launch');
                            }
                          },
                          playstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://play.google.com/store/apps/details?id=com.carclenx.motor.shoping'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                        ),
                      ),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: ServiceToolTile(
                          image: SvgAssets.volt,
                          isMobile: true,
                          name: 'Volt',
                          appstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://apps.apple.com/in/app/volt-speed-camera-app/id6462087014'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                          playstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://play.google.com/store/apps/details?id=com.volt.map'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                        ),
                      ),
                      space.w8,
                      SlideTransition(
                        position: _offsetAnimation,
                        child: ServiceToolTile(
                          image: SvgAssets.pathathon,
                          isMobile: true,
                          name: 'Pathathon',
                          appstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://apps.apple.com/in/app/pathathon/id6446797435'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                          playstorePressed: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'https://play.google.com/store/search?q=pathathon&c=apps'),
                            )) {
                              throw Exception('Could not launch');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              )
            : Row(
                children: [
                  const Spacer(),
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: ServiceToolTile(
                      image: SvgAssets.gangupp,
                      name: 'Gangupp',
                      appstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.gangupp.gangupp'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                      playstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.gangupp.gangupp'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation1,
                    child: ServiceToolTile(
                      image: SvgAssets.pexa,
                      name: 'Pexa',
                      appstorePressed: () async {
                        if (!await launchUrl(Uri.parse(
                            'https://apps.apple.com/in/app/pexa/id1613868591'))) {
                          throw Exception('Could not launch');
                        }
                      },
                      playstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.carclenx.motor.shoping'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: ServiceToolTile(
                      image: SvgAssets.volt,
                      name: 'Volt',
                      appstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://apps.apple.com/in/app/volt-speed-camera-app/id6462087014'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                      playstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.volt.map'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: ServiceToolTile(
                      image: SvgAssets.pathathon,
                      name: 'Pathathon',
                      appstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://apps.apple.com/in/app/pathathon/id6446797435'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                      playstorePressed: () async {
                        if (!await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/search?q=pathathon&c=apps'),
                        )) {
                          throw Exception('Could not launch');
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              )
      ],
    );
  }
}
