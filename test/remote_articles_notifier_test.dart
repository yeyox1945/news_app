import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/datasources/articles/remote_datasource.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/providers/articles/remote_pagination_provider.dart';

class MockRemoteArticlesDatasource extends Mock implements RemoteArticlesDatasource {}

void main() async {
  late ArticlesNotifier sut;
  late MockRemoteArticlesDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockRemoteArticlesDatasource();
    sut = ArticlesNotifier(fetchMoreArticles: mockDatasource.getArticles);
  });

  test('Initial values are correct', () {
    expect(sut.fetchMoreArticles, isA<Future<List<ArticleEntity>> Function({int page})>());
    expect(sut.currentPage, 0);
    expect(sut.isLoading, false);
    expect(sut.state, []);
  });

  group('Pagination tests', () {
    final articlesFromDatasource = [
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
      when(() => mockDatasource.getArticles()).thenReturn(
        () async => articlesFromDatasource,
      );
    }

    test(
      'Gets articles using fetchMoreArticles callback once',
      () async {
        sut.loadNextPage(); // Act
        when(() => mockDatasource.getArticles()).thenReturn(() async => []); // Arrange
        verify(() => mockDatasource.getArticles()).called(1); // Assert
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
        expect(sut.state, [...sut.state, articlesFromDatasource]);
        expect(sut.isLoading, false);
      },
    );

    test(
      """Indicates loading of data,
      sets the list of articles to the first page,
      resets the page to one,
      indicates that data is not being loaded anymore""",
      () async {
        arrangeDatasource2Articles();
        final future = sut.loadNextPage();
        expect(sut.isLoading, true);
        expect(sut.currentPage, 0);
        await future;
        expect(sut.state, articlesFromDatasource);
        expect(sut.isLoading, false);
      },
    );
  });
}
