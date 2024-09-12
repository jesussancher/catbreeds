import 'package:catbreeds/core/di/di.dart';
import 'package:catbreeds/ui/pages/detail_view.dart';
import 'package:catbreeds/ui/pages/home_view.dart';
import 'package:catbreeds/ui/pages/search_view.dart';
import 'package:catbreeds/ui/pages/splash_view.dart';

/// Defines the application's routes and their corresponding view pages.
final routes = {
  /// Route for the home view.
  '/': (context) => getIt.get<HomeView>(),

  /// Route for the splash screen.
  '/splash': (context) => getIt.get<SplashView>(),

  /// Route for the search view.
  '/search': (context) => getIt.get<SearchView>(),

  /// Route for the detail view.
  '/detail': (context) => getIt.get<DetailView>(),
};
