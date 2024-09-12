import 'package:catbreeds/domain/models/params/params.dart';

/// Represents a parameterless request.
class NoParam extends Params {
  /// Creates an instance of [NoParam].
  NoParam();

  /// Throws an [UnimplementedError].
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
