import 'package:news_app/domain/entities/article_entity.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(ArticleEntity article);
  Future<bool> isArticleFavorite(int articleId);
  Future<List<ArticleEntity>> loadMovies({int limit = 10, offset = 0});
}
