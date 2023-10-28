class ArticlesResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ArticlesResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) => ArticlesResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'no-author',
        title: json["title"],
        description: json["description"] ?? 'no-description',
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'no-content',
      );
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
