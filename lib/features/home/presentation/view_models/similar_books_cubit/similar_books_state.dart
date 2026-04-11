part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}

final class SimilarBooksError extends SimilarBooksState {
  final String errMessage;

  SimilarBooksError(this.errMessage);
}

final class SimilarBooksLoading extends SimilarBooksState {}
