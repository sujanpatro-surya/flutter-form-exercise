class RouteNotFoundError extends Error {
  final String? message;

  RouteNotFoundError({this.message});

  @override
  String toString() {
    return 'RouteNotFound{message: ${message ?? 'This Route is not defined'}}';
  }
}
