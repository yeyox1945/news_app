import 'package:news_app/data/datasources/articles/local_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/articles/local_repository.dart';

class LocalArticlesRepositoryImpl extends LocalArticlesRepository {
  final LocalArticlesDatasource datasource;

  LocalArticlesRepositoryImpl({required this.datasource});

  @override
  Future<bool> isArticleFavorite(int articleId) => datasource.isArticleFavorite(articleId);

  @override
  Future<List<ArticleEntity>> loadArticles({int limit = 10, offset = 0}) => datasource.loadArticles();

  @override
  Future<void> toggleFavorite(ArticleEntity article) => datasource.toggleFavorite(article);
}
