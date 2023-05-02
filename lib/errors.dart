class DeveloperError extends Error {
  final String? message;

  DeveloperError({this.message});

  @override
  String toString() {
    return 'DeveloperError: ${message ?? ''}';
  }
}
