import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/pages/about/view/about.dart';
import 'package:portfolio/pages/contact/view/contact.dart';
import 'package:portfolio/pages/dashboard/view/components/dashboard_bar.dart';
import 'package:portfolio/pages/dashboard/view_model/dashboard_view_model.dart';
import 'package:portfolio/pages/home/view/home.dart';
import 'package:portfolio/pages/services/view/services.dart';
import 'package:portfolio/pages/tool_and_tech/view/tool_and_tech.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/styles/sizedbox.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Widget> pages = [
    const HomePage(),
    const AboutPage(),
    const ToolAndTechPage(),
    const ServicesPage(),
    const ContactPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final dashBoard = Provider.of<DashboardViewModel>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      endDrawer: SizedBox(
        width: 100.sp,
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.all(10.sp),
            children: <Widget>[
              space.h32,
              dashBoardTileMobile(
                index: 0,
                name: 'Home',
                onTap: () {
                  dashBoard.changeIndex(0);
                  Navigator.pop(context);
                },
              ),
              dashBoardTileMobile(
                index: 1,
                name: 'About',
                onTap: () {
                  dashBoard.changeIndex(1);
                  Navigator.pop(context);
                },
              ),
              dashBoardTileMobile(
                index: 2,
                name: 'Tool & Tech',
                onTap: () {
                  dashBoard.changeIndex(2);
                  Navigator.pop(context);
                },
              ),
              dashBoardTileMobile(
                index: 3,
                name: 'Projects',
                onTap: () {
                  dashBoard.changeIndex(3);
                  Navigator.pop(context);
                },
              ),
              dashBoardTileMobile(
                index: 4,
                name: 'Contact',
                onTap: () {
                  dashBoard.changeIndex(4);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardBar(scaffoldKey: scaffoldKey),
                Expanded(
                  child: pages[dashBoard.pageIndex],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Image.asset(
                PngAssets.bgImage,
                fit: BoxFit.fitWidth,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashBoardTileMobile({
    required String name,
    required int index,
    required VoidCallback onTap,
  }) {
    final dashBoard = Provider.of<DashboardViewModel>(context);
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name,
        style: dashBoard.pageIndex == index
            ? tn.inter.s14.w4.white
            : tn.inter.s14.w4.grey1,
      ),
    );
  }
}
