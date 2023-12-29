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

  Future<Book> addBook(Book book) async {
    try {
      final bookDaos = BookModelDaos(
        isbn: book.isbn,
        title: book.title,
        subtitle: book.subtitle,
        author: book.author,
        published: book.published,
        publisher: book.publisher,
        pages: book.pages,
        description: book.description,
        website: book.website,
      );
      final res = await _bookRepository.addBook(bookDaos);
      final bookResponse = Book.fromData(res);
      return bookResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> updateBook(Book newBook) async {
    try {
      final book = BookModelDaos(
        id: newBook.id,
        isbn: newBook.isbn,
        title: newBook.title,
        subtitle: newBook.subtitle,
        author: newBook.author,
        published: newBook.published,
        publisher: newBook.publisher,
        pages: newBook.pages,
        description: newBook.description,
        website: newBook.website,
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
