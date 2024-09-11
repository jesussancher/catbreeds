import 'package:catbreeds/core/di/di.dart';
import 'package:catbreeds/ui/pages/home_view.dart';
import 'package:catbreeds/ui/pages/search_view.dart';
import 'package:catbreeds/ui/pages/splash_view.dart';

final routes = {
  '/': (context) => getIt.get<HomeView>(),
  '/splash': (context) => getIt.get<SplashView>(),
  '/search': (context) => getIt.get<SearchView>(),
};
