import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModelModule {
  HomeViewModel get viewModelModule;
}
