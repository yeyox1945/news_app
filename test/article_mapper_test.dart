import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/mappers/article_mapper.dart';
import 'package:news_app/data/models/articles/articles_response_model.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class MockArticle extends Mock implements Article {}

void main() {
  test('Mapper should succesfully parse a Article to a Article Entity', () {
    final ArticleEntity articleEntity = ArticleMapper.articleToEntity(MockArticle());

    expect(articleEntity, isA<ArticleEntity>());
  });
}
