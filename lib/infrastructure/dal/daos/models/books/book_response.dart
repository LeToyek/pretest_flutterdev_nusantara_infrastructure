// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookModelDaos {
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

  BookModelDaos(
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

  BookModelDaos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isbn = json['isbn'];
    title = json['title'];
    subtitle = json['subtitle'];
    author = json['author'];
    published = json['published'];
    publisher = json['publisher'];
    pages = json['pages'];
    description = json['description'];
    website = json['website'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'isbn': isbn,
        'title': title,
        'subtitle': subtitle,
        'author': author,
        'published': published,
        'publisher': publisher,
        'pages': pages,
        'description': description,
        'website': website,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Map<String, dynamic> toAddJson() => {
        'isbn': isbn,
        'title': title,
        'subtitle': subtitle,
        'author': author,
        'published': published,
        'publisher': publisher,
        'pages': pages,
        'description': description,
        'website': website,
      };

  BookModelDaos copyWith({
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
    return BookModelDaos(
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
