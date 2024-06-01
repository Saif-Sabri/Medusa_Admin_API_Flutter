class Inspiration {
  const Inspiration({
    required this.imageUrl,
    required this.id,
  });

  factory Inspiration.fromJson(Map<String, dynamic> map) => Inspiration(
        imageUrl: map["image"]!.toString(),
        id: map["_id"]!.toString(),
      );

  final String id;
  final String imageUrl;
}
