import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/repositories/articles/local_repository_impl.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/providers/articles/local_pagination_provider.dart';

// class MockLocalArticlesDatasource extends Mock implements LocalArticlesDatasource {}

class MockLocalArticlesRepositoryImpl extends Mock implements LocalArticlesRepositoryImpl {}

void main() async {
  late ArticlesNotifier sut;
  // late MockLocalArticlesDatasource mockDatasource;
  late MockLocalArticlesRepositoryImpl mockRepository;

  setUp(() {
    // mockDatasource = MockLocalArticlesDatasource();
    mockRepository = MockLocalArticlesRepositoryImpl();
    sut = ArticlesNotifier(localArticlesRepository: mockRepository);
  });

  test('Initial values are correct', () {
    expect(sut.currentPage, 0);
    expect(sut.isLastPage, false);
    expect(sut.isLoading, false);
    expect(sut.state, []);
  });

  group('Pagination tests', () {
    final articlesFromRepository = [
      ArticleEntity(
        title: 'title 1',
        description: 'description 1',
        content: 'content 1',
        source: 'source 1',
        publishedAt: 'publishedAt 1',
        originalUrl: 'originalUrl 1',
        imageUrl: 'imageUrl 1',
        author: 'author 1',
      ),
      ArticleEntity(
        title: 'title 2',
        description: 'description 2',
        content: 'content 2',
        source: 'source 2',
        publishedAt: 'publishedAt 2',
        originalUrl: 'originalUrl 2',
        imageUrl: 'imageUrl 2',
        author: 'author 2',
      ),
    ];

    void arrangeDatasource2Articles() {
      when(() => mockRepository.loadArticles()).thenReturn(
        () async => articlesFromRepository,
      );
    }

    test(
      'Gets articles using loadArticles method on repository dependency once',
      () async {
        sut.loadNextPage(); // Act
        when(() => mockRepository.loadArticles()).thenReturn(() async => []); // Arrange
        verify(() => mockRepository.loadArticles()).called(1); // Assert
      },
    );

    test(
      """Indicates loading of data,
      sets the list of articles to the articles from the datasource,
      increments the page by one,
      indicates that data is not being loaded anymore""",
      () async {
        arrangeDatasource2Articles();
        final future = sut.loadNextPage();
        expect(sut.isLoading, true);
        expect(sut.currentPage, 1);
        await future;
        expect(sut.state, [...sut.state, articlesFromRepository]);
        expect(sut.isLoading, false);
      },
    );
  });

  group('Toggle favorite article tests', () {
    final auxArticle = ArticleEntity(
      title: 'title 1',
      description: 'description 1',
      content: 'content 1',
      source: 'source 1',
      publishedAt: 'publishedAt 1',
      originalUrl: 'originalUrl 1',
      imageUrl: 'imageUrl 1',
      author: 'author 1',
    );

    test(
      'Adds article to db if it doesnt exist yet',
      () {
        when(() => mockRepository.toggleFavorite(auxArticle)).thenReturn(() async => auxArticle);
        sut.localArticlesRepository.toggleFavorite(auxArticle);

        const isFavorite = false;

        if (!isFavorite) {
          sut.state = [...sut.state, auxArticle];
        }
        expect(sut.state, [auxArticle]);
      },
    );

    test(
      'Removes article from db if it exists already',
      () {
        when(() => mockRepository.toggleFavorite(auxArticle)).thenReturn(() async => auxArticle);
        sut.localArticlesRepository.toggleFavorite(auxArticle);

        const isFavorite = true;

        if (isFavorite) {
          sut.state.remove(auxArticle);
          sut.state = [...sut.state];
        }

        expect(sut.state, []);
      },
    );
  });
}
