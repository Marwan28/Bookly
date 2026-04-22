import 'package:bookly/core/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
      'volumes?filter=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?filter=free-ebooks&orderBy=newest&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(
      {required String category}) async {
    var data = await apiService.get(
      endPoint: 'volumes?filter=free-ebooks&q=subject:$category',
    );
    return getBooksList(data);
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    final items = data['items'] as List?;
    if (items == null) return [];
    return items
        .map((bookMap) => BookModel.fromJson(bookMap as Map<String, dynamic>))
        .toList();
  }
}