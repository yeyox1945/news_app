import 'package:news_app/config/constants/environment.dart';
import 'package:news_app/data/mappers/article_mapper.dart';
import 'package:news_app/data/models/articles/articles_response_model.dart';
import 'package:news_app/domain/datasources/articles/remote_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';

class RemoteArticlesDatasource extends ArticlesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://newsapi.org/v2',
    queryParameters: {
      'apiKey': Environment.newsApiKey,
      'country': 'us',
      'pageSize': 10,
    },
  ));

  @override
  Future<List<ArticleEntity>> getArticles({int page = 1}) async {
    final resp = await dio.get('/top-headlines', queryParameters: {'page': page});

    final articlesResponse = ArticlesResponse.fromJson(resp.data);

    final List<ArticleEntity> articles = articlesResponse.articles
        .where((articleModel) => articleModel.title != '[Removed]')
        .map((article) => ArticleMapper.articleToEntity(article))
        .toList();

    return articles;
  }
}
