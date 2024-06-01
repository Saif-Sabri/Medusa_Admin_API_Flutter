class Inspiration {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  String? subtitle;
  String description;
  String handle;
  String styles;
  String? thumbnail;
  int price;

  Inspiration({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.handle,
    required this.styles,
    required this.thumbnail,
    required this.price,
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
      handle: json['handle'] as String,
      styles: json['styles'] as String,
      thumbnail: json['thumbnail'] as String?,
      price: json['price'] as int,
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
