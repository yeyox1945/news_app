import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/mappers/article_mapper.dart';
import 'package:news_app/data/models/articles/articles_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';

// class MockDateTime extends Mock implements DateTime {}

void main() {
  late Article article;

  setUp(() {
    article = Article(
        source: Source(id: '1', name: 'source'),
        author: 'author',
        title: 'title',
        description: 'description',
        url: 'url',
        urlToImage: 'urlToImage',
        publishedAt: DateTime(2023),
        content: 'content');
  });

  test('Mapper type test', () {
    final entity = ArticleMapper.articleToEntity(article);
    expect(entity, isA<ArticleEntity>());
  });
}
