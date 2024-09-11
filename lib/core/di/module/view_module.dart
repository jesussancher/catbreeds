import 'package:catbreeds/ui/pages/home_view.dart';
import 'package:catbreeds/ui/pages/search_view.dart';
import 'package:catbreeds/ui/pages/splash_view.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModule {
  SplashView get splashView;
  HomeView get homeView;
  SearchView get serachView;
}
