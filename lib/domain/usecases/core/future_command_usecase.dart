import 'package:catbreeds/domain/usecases/core/base_usecase.dart';

abstract class FutureCommandUseCase<I>
    implements BaseUseCase<Future<void>, I> {}
