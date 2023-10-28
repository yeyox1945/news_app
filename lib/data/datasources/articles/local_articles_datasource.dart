import 'package:news_app/domain/datasources/articles_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class LocalArticlesDatasource implements ArticlesDatasource {
  @override
  Future<List<ArticleEntity>> getArticles({int page = 1}) {
    throw UnimplementedError();
  }
}
