import 'package:news_app/data/models/articles/articles_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class ArticleMapper {
  static ArticleEntity articleToEntity(Article article) {
    return ArticleEntity(
      title: article.title,
      description: article.description,
      content: article.content,
      source: article.source.name,
      publishedAt: article.publishedAt.toString(),
      originalUrl: article.url,
      imageUrl: article.urlToImage,
      author: article.author,
    );
  }
}
