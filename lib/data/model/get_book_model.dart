import 'dart:core';

class GetBookModel {
  String? id;
  String? title;
  String? summary;
  String? author;
  String? category;
  String? totalPage;
  String? price;
  int? totalBooks;
  List<String>? bookISBN;
  List<String>? image;

  GetBookModel(
      {this.id,
        this.title,
        this.summary,
        this.author,
        this.category,
        this.totalPage,
        this.price,
        this.totalBooks,
        this.bookISBN,
        this.image});
}
