import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offto/Features/Home/View/Screens/home_screen.dart';
import 'package:offto/Routing/routes.dart';

class CustomRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: Routes.home.path,
      routes: _routes);

  static GoRouter get router => _router;
  static final List<GoRoute> _routes = [
    home,
  ];
  static final home = GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      builder: (context, state) {
        return HomeScreen();
      });
}

class RouterTransitions {
  static CustomTransitionPage getFadeTransitionPage(
          {required BuildContext context,
          required GoRouterState state,
          required Widget child}) =>
      CustomTransitionPage(
        child: child,
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );

  static CustomTransitionPage getSlideTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      CustomTransitionPage(
        child: child,
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const offsetBegin = Offset(1.0, 0.0);
          const offsetEnd = Offset.zero;

          var slideAnimation = Tween<Offset>(
            begin: offsetBegin,
            end: offsetEnd,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ));

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      );
}
