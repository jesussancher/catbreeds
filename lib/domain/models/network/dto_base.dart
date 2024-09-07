abstract class DTOBase<T> {
  T fromJson(Map<String, dynamic>? data);

  Map<String, dynamic> toJson(T? data);
}
