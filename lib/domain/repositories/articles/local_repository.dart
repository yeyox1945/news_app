import 'package:news_app/domain/entities/article_entity.dart';

abstract class LocalArticlesRepository {
  Future<void> toggleFavorite(ArticleEntity article);
  Future<bool> isArticleFavorite(String title);
  Future<List<ArticleEntity>> loadArticles({int limit = 10, offset = 0});
}
