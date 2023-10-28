import 'package:news_app/domain/entities/article_entity.dart';

abstract class ArticlesRepository {
  Future<List<ArticleEntity>> getArticles({int page = 1});
}
