// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/books/book_response.dart';

class Book {
  int? id;
  int? userId;
  String? isbn;
  String? title;
  String? subtitle;
  String? author;
  String? published;
  String? publisher;
  int? pages;
  String? description;
  String? website;
  String? createdAt;
  String? updatedAt;

  Book(
      {this.id,
      this.userId,
      this.isbn,
      this.title,
      this.subtitle,
      this.author,
      this.published,
      this.publisher,
      this.pages,
      this.description,
      this.website,
      this.createdAt,
      this.updatedAt});

  Book.fromData(BookModelDaos data) {
    id = data.id;
    userId = data.userId;
    isbn = data.isbn;
    title = data.title;
    subtitle = data.subtitle;
    author = data.author;
    published = data.published;
    publisher = data.publisher;
    pages = data.pages;
    description = data.description;
    website = data.website;
    createdAt = data.createdAt;
    updatedAt = data.updatedAt;
  }

  Book copyWith({
    int? id,
    int? userId,
    String? isbn,
    String? title,
    String? subtitle,
    String? author,
    String? published,
    String? publisher,
    int? pages,
    String? description,
    String? website,
    String? createdAt,
    String? updatedAt,
  }) {
    return Book(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        isbn: isbn ?? this.isbn,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        author: author ?? this.author,
        published: published ?? this.published,
        publisher: publisher ?? this.publisher,
        pages: pages ?? this.pages,
        description: description ?? this.description,
        website: website ?? this.website,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}
