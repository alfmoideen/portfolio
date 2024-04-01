import 'package:flutter/material.dart';
import 'package:portfolio/pages/tool_and_tech/view/component/tool_tile.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';

class ToolAndTechPage extends StatefulWidget {
  const ToolAndTechPage({super.key});

  @override
  State<ToolAndTechPage> createState() => _ToolAndTechPageState();
}

class _ToolAndTechPageState extends State<ToolAndTechPage>
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
      begin: const Offset(-1.0, 0.0), // Offscreen at the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Offscreen at the bottom
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
                    'Tools & Tech',
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
                      'Tools & Tech',
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
                          child: ToolTile(
                            image: SvgAssets.flutter,
                            name: 'Flutter',
                            isMobile: true,
                          ),
                        ),
                        space.w4,
                        SlideTransition(
                          position: _offsetAnimation1,
                          child: ToolTile(
                            image: SvgAssets.dart,
                            name: 'Dart',
                            isMobile: true,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    space.h8,
                    Row(
                      children: [
                        const Spacer(),
                        SlideTransition(
                          position: _offsetAnimation,
                          child: ToolTile(
                            image: SvgAssets.firebase,
                            name: 'Firebase',
                            isMobile: true,
                          ),
                        ),
                        space.w4,
                        SlideTransition(
                          position: _offsetAnimation1,
                          child: ToolTile(
                            image: SvgAssets.appstore,
                            name: 'Appstore',
                            isMobile: true,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    space.h8,
                    Row(
                      children: [
                        const Spacer(),
                        ToolTile(
                          image: SvgAssets.playstore,
                          name: 'Playstore',
                          isMobile: true,
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
                      child: ToolTile(
                        image: SvgAssets.flutter,
                        name: 'Flutter',
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: ToolTile(
                        image: SvgAssets.dart,
                        name: 'Dart',
                      ),
                    ),
                    ToolTile(
                      image: SvgAssets.firebase,
                      name: 'Firebase',
                    ),
                    SlideTransition(
                      position: _offsetAnimation1,
                      child: ToolTile(
                        image: SvgAssets.appstore,
                        name: 'Appstore',
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation1,
                      child: ToolTile(
                        image: SvgAssets.playstore,
                        name: 'Playstore',
                      ),
                    ),
                    const Spacer(),
                  ],
                )
        ],
      ),
    );
  }
}
