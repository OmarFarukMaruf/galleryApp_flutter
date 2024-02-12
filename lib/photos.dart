class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json['id'],
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl'],
  );
}