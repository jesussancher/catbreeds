abstract class BaseUseCase<O, I> {
  O call(I input);
}
