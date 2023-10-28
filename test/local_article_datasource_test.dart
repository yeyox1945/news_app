import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/datasources/articles/local_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class MockLocalArticlesDatasource extends Mock implements LocalArticlesDatasource {}

class MockArticleEntity extends Mock implements ArticleEntity {}

void main() {
  group('database operations', () {
    final localDatasource = MockLocalArticlesDatasource();

    test('Should return a list of articles in favorites', () {
      final resp = localDatasource.loadArticles();

      expectLater(resp, isA<List<ArticleEntity>>());
    });

    test('Should get is an article is saved on the database as a favorite', () {
      final mockArticleEntity = MockArticleEntity();
      final resp = localDatasource.isArticleFavorite(mockArticleEntity.title);

      expectLater(resp, true);
    });
  });
}
