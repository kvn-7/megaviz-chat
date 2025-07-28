extension ListExtension<E> on List<E> {
  /// indexedMap
  /// Returns a new list with the results of applying the
  /// given function to every element of this list.
  List<T> indexedMap<T>(T Function(int index, E element) f) {
    return List.generate(length, (index) => f(index, this[index]));
  }
}
