import 'package:flutter/material.dart';

class RouteNavigateObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    print('didPush. from: ${previousRoute?.settings.name},'
        ' to: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    print('didPop. from: ${previousRoute?.settings.name},'
        ' to: ${route.settings.name}');
  }
}
