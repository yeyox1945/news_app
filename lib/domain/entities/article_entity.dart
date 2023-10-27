class ArticleEntity {
  String title;
  String description;
  String content;
  String source;
  String publishedAt;
  String originalUrl;
  String imageUrl;
  String author;

  ArticleEntity({
    required this.title,
    required this.description,
    required this.content,
    required this.source,
    required this.publishedAt,
    required this.originalUrl,
    required this.imageUrl,
    required this.author,
  });
}
