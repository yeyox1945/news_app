import 'package:news_app/domain/entities/article_entity.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(ArticleEntity article);
  Future<bool> isArticleFavorite(String title);
  Future<List<ArticleEntity>> loadArticles({int limit = 10, int offset = 0});
}
