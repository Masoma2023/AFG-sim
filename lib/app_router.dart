import 'package:afg_sim/screen/bundle_details.dart';
import 'package:afg_sim/screen/bundles_screen.dart';
import 'package:afg_sim/screen/providers_screen.dart';
import 'package:afg_sim/screen/splash_screen.dart';
import 'package:flutter/material.dart';
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/providers':
        return MaterialPageRoute(builder: (_) => const ProvidersScreen());
      case '/bundles':
        final providerName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BundlesScreen(providerName: providerName),
        );
      case '/bundleDetails':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BundleDetailsScreen(
            providerName: args['providerName'] as String,
            bundle: Map<String, String>.from(args['bundle'] as Map),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
