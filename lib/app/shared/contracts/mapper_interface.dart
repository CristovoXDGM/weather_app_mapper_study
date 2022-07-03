abstract class MapperInterface<T> {
  Future<T> fromMap(Map<String, dynamic> map);

  Map toMap(T map);
}
