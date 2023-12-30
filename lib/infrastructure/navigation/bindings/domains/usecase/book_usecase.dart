import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/books/book_response.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/repository/book_repository.dart';

class BookUseCase {
  final BookRepository _bookRepository;

  BookUseCase(this._bookRepository);

  Future<List<Book>> getBooks() async {
    try {
      final res = await _bookRepository.getBooks();
      final books = res.map((e) => Book.fromData(e)).toList();
      return books;
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> getBookById(int id) async {
    try {
      final res = await _bookRepository.getBookById(id);
      final book = Book.fromData(res);
      return book;
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> addBook({
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publisher,
    required int pages,
    required String description,
    required String website,
    required DateTime published,
  }) async {
    try {
      final stringPublished = published.toString();
      final bookDaos = BookModelDaos(
        isbn: isbn,
        title: title,
        subtitle: subtitle,
        author: author,
        publisher: publisher,
        published: stringPublished,
        pages: pages,
        description: description,
        website: website,
      );
      final res = await _bookRepository.addBook(bookDaos);
      final bookResponse = Book.fromData(res);
      return bookResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> updateBook({
    required int id,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publisher,
    required int pages,
    required String description,
    required String website,
    required DateTime published,
  }) async {
    try {
      final stringPublished = published.toString();
      final book = BookModelDaos(
        id: id,
        isbn: isbn,
        title: title,
        subtitle: subtitle,
        author: author,
        publisher: publisher,
        published: stringPublished,
        pages: pages,
        description: description,
        website: website,
      );
      final res = await _bookRepository.updateBook(book);
      final bookResponse = Book.fromData(res);
      return bookResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await _bookRepository.deleteBook(id);
    } catch (e) {
      rethrow;
    }
  }
}
