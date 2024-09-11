import 'package:catbreeds/presentation/cat_card_viewmodel.dart';
import 'package:catbreeds/presentation/detail_viewmodel.dart';
import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:catbreeds/presentation/search_viewmodel.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ViewModelModule {
  HomeViewModel get homeViewmodel;
  CatCardViewModel get catCardViewmodel;
  SearchViewModel get searchViewModel;
  DetailViewModel get detailViewModel;
}
