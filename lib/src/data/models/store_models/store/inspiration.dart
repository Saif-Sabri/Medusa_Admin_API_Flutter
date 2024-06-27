import 'package:medusa_admin_flutter/medusa_admin.dart';

class Inspiration {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  String? subtitle;
  String description;
  String? author;
  String handle;
  String? status;
  String styles;
  String? thumbnail;
  String? secondThumbnail;
  int price;
  List<String?>? categories;
  List<String?>? images;
  List<Product?>? products;

  Inspiration({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.author,
    required this.handle,
    required this.status,
    required this.styles,
    required this.thumbnail,
    required this.secondThumbnail,
    required this.price,
    required this.categories,
    required this.images,
    required this.products,
  });

  factory Inspiration.fromJson(Map<String, dynamic> json) {
    return Inspiration(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String,
      author: json['author'] as String?,
      handle: json['handle'] as String,
      status: json['status'] as String?,
      styles: json['styles'] as String,
      thumbnail: json['thumbnail'] as String?,
      secondThumbnail: json['second_thumbnail'] as String?,
      price: json['price'] as int,
      categories: json['categories'] != null
          ? List<String?>.from(
              json['categories'].map((x) => x['name'] as String?))
          : null,
      images: json['images'] != null
          ? List<String?>.from(json['images'].map((x) => x['url'] as String?))
          : null,
      products: json['products'] != null
          ? List<Product?>.from(
              json['products'].map((i) => Product.fromJson(i)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'deleted_at': deletedAt,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'handle': handle,
      'styles': styles,
      'thumbnail': thumbnail,
      'price': price,
    };
  }
}
