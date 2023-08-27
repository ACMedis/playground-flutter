sealed class CustomerAddState {
  final String? errorMessage;

  CustomerAddState({
    required this.errorMessage,
  });

  factory CustomerAddState.initial() => CustomerAddInitialState();

  CustomerAddState setLoading() {
    return CustomerAddLoadingState();
  }

  CustomerAddState setSaved() {
    return CustomerAddSavedState();
  }

  CustomerAddState setError(String message) {
    return CustomerAddErrorState(errorMessage: message);
  }
}

class CustomerAddInitialState extends CustomerAddState {
  CustomerAddInitialState() : super(errorMessage: '');
}

class CustomerAddLoadingState extends CustomerAddState {
  CustomerAddLoadingState() : super(errorMessage: '');
}

class CustomerAddSavedState extends CustomerAddState {
  CustomerAddSavedState() : super(errorMessage: '');
}

class CustomerAddErrorState extends CustomerAddState {
  CustomerAddErrorState({required super.errorMessage});
}
