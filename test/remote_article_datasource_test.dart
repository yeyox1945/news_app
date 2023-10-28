import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/datasources/articles/remote_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class MockRemoteArticlesDatasource extends Mock implements RemoteArticlesDatasource {}

void main() {
  setUp(() {});
  tearDown(() => {});

  test('Should get a response from the newsapi', () {
    final mockService = MockRemoteArticlesDatasource();

    final resp = mockService.getArticles();

    expectLater(resp, isA<List<ArticleEntity>>());
  });
}
