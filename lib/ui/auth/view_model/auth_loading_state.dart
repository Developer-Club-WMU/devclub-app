class AuthLoadingState {
    
    // Constructor
    const AuthLoadingState(this.state, this.error);

    // properties
    final LoadingStateEnum state;
    final Exception? error;

    // methods
    bool get isLoading => state == LoadingStateEnum.loading;

    bool get hasError => state == LoadingStateEnum.error;
}

// Enum that show different loading states
enum LoadingStateEnum {
    initial,
    loading,
    success,
    error,
}