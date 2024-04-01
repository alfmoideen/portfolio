import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/pages/dashboard/view_model/dashboard_view_model.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:provider/provider.dart';

class DashboardBar extends StatefulWidget {
  const DashboardBar({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<DashboardBar> createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final dashBoard = Provider.of<DashboardViewModel>(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        // For mobile view
        return Column(
          children: [
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        if (widget.scaffoldKey.currentState!.isEndDrawerOpen) {
          Navigator.pop(context);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () => dashBoard.changeIndex(0),
              child: const DashBoardTile(
                index: 0,
                name: 'Home',
              ),
            ),
            GestureDetector(
              onTap: () => dashBoard.changeIndex(1),
              child: const DashBoardTile(
                index: 1,
                name: 'About',
              ),
            ),
            GestureDetector(
              onTap: () => dashBoard.changeIndex(2),
              child: const DashBoardTile(
                index: 2,
                name: 'Tools & Tech',
              ),
            ),
            GestureDetector(
              onTap: () => dashBoard.changeIndex(3),
              child: const DashBoardTile(
                index: 3,
                name: 'Projects',
              ),
            ),
            GestureDetector(
              onTap: () => dashBoard.changeIndex(4),
              child: const DashBoardTile(
                index: 4,
                name: 'Contact',
              ),
            ),
          ],
        );
      }
    });
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

class DashBoardTile extends StatefulWidget {
  const DashBoardTile({
    super.key,
    required this.name,
    required this.index,
  });
  final String name;
  final int index;

  @override
  State<DashBoardTile> createState() => _DashBoardTileState();
}

class _DashBoardTileState extends State<DashBoardTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final dashBoard = Provider.of<DashboardViewModel>(context);
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(isHover ? 1.2 : 1.0),
        transformAlignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: isHover ? 4.w : 2.w,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
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
              spreadRadius: isHover ? 5 : 3,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          widget.name,
          style: dashBoard.pageIndex == widget.index
              ? tn.inter.s4.w4.white
              : tn.inter.s4.w4.grey1,
        ),
      ),
    );
  }
}
