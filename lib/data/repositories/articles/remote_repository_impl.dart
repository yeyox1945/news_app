import 'package:news_app/domain/datasources/articles/remote_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/articles/remote_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesDatasource datasource;

  ArticlesRepositoryImpl({required this.datasource});

  @override
  Future<List<ArticleEntity>> getArticles({int page = 1}) => datasource.getArticles(page: page);
}
