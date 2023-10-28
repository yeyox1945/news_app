import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/providers/articles/remote_repository_provider.dart';

final articlesProvider = StateNotifierProvider<ArticlesNotifier, List<ArticleEntity>>((ref) {
  final fetchMoreArticles = ref.watch(remoteRepositoryProvider).getArticles;

  return ArticlesNotifier(fetchMoreArticles: fetchMoreArticles);
});

typedef ArticlesCallback = Future<List<ArticleEntity>> Function({int page});

class ArticlesNotifier extends StateNotifier<List<ArticleEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  ArticlesCallback fetchMoreArticles;

  ArticlesNotifier({required this.fetchMoreArticles}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final List<ArticleEntity> articles = await fetchMoreArticles(page: currentPage);
    state = [...state, ...articles];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
