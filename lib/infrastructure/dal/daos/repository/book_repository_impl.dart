import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/books/book_response.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/nusantara_api_client.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/repository/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  final NusantaraApiClient _nusantaraApiClient;

  BookRepositoryImpl(this._nusantaraApiClient);

  @override
  Future<BookModelDaos> addBook(BookModelDaos book) async {
    try {
      final res =
          await _nusantaraApiClient.post("/books", data: book.toAddJson());
      final bookResponse = BookModelDaos.fromJson(res.data);
      return bookResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteBook(int id) {
    try {
      return _nusantaraApiClient.delete("/books/$id");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookModelDaos> getBookById(int id) async {
    try {
      final res = await _nusantaraApiClient.get("/books/$id");
      final book = BookModelDaos.fromJson(res.data);
      return book;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BookModelDaos>> getBooks() async {
    try {
      final res = await _nusantaraApiClient.get("/books");
      final books = res.data['data'] as List;
      final booksResponse =
          books.map((e) => BookModelDaos.fromJson(e)).toList();
      return booksResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookModelDaos> updateBook(BookModelDaos book) async {
    try {
      final res = await _nusantaraApiClient.put("/books/${book.id}/edit",
          data: book.toAddJson());
      final bookResponse = BookModelDaos.fromJson(res.data);
      return bookResponse;
    } catch (e) {
      rethrow;
    }
  }
}
