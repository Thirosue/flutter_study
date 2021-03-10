import 'package:flutter/material.dart';

class RouteNavigateObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    print('from: ${route.settings.name}, to: ${previousRoute?.settings.name}');
  }
}
