class Inspiration {
  const Inspiration({
    required this.thumbnail,
    required this.id,
  });

  factory Inspiration.fromJson(Map<String, dynamic> map) => Inspiration(
        thumbnail: map["thumbnail"]!.toString(),
        id: map["_id"]!.toString(),
      );

  final String id;
  final String thumbnail;
}
