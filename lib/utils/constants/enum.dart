enum LoadingState { error, loading, idle, done }

extension ViewStateExtension on LoadingState {
  bool get isLoading => this == LoadingState.loading;
  bool get isIdle => this == LoadingState.idle;
  bool get isError => this == LoadingState.error;
  bool get isDone => this == LoadingState.done;
}

enum TextType {
  headerText,
  bigText,
  largeText,
  mediumText,
  smallText,
  smallestText
}
