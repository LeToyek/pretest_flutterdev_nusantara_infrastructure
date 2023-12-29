import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/books/book_response.dart';

abstract class BookRepository {
  Future<List<BookModelDaos>> getBooks();
  Future<BookModelDaos> getBookById(int id);
  Future<BookModelDaos> addBook(BookModelDaos book);
  Future<BookModelDaos> updateBook(BookModelDaos book);
  Future<void> deleteBook(int id);
}
