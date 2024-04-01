import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/dashboard/view/dashboard.dart';

final GoRouter routeList = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Dashboard();
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'onBoard',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const OnBoardScreen();
        //   },
        // ),
      ],
    ),
  ],
);
