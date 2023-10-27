import 'package:news_app/domain/entities/article_entity.dart';

abstract class ArticlesDatasource {
  Future<List<ArticleEntity>> getArticles({int page = 1});
}
