abstract class Result<T>{}

class Success<T> extends Result<T> {
	final T data;
	Success({required this.data});
}

class Error<T> extends Result<T> {
	final Object error;
	Error({required this.error});
}

class Loading<T> extends Result<T> {
	final T? data;
	Loading({this.data});
}