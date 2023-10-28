import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/articles/local_repository.dart';
import 'package:news_app/presentation/providers/articles/local_repository_provider.dart';

final localArticlesProvider = StateNotifierProvider<ArticlesNotifier, List<ArticleEntity>>((ref) {
  final localRepository = ref.watch(localRepositoryProvider);

  return ArticlesNotifier(localArticlesRepository: localRepository);
});

class ArticlesNotifier extends StateNotifier<List<ArticleEntity>> {
  final LocalArticlesRepository localArticlesRepository;
  int currentPage = 0;
  bool isLoading = false;
  bool isLastPage = false;

  ArticlesNotifier({required this.localArticlesRepository}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final List<ArticleEntity> articles =
        await localArticlesRepository.loadArticles(offset: currentPage * 10, limit: 10);
    currentPage++;

    state = [...state, ...articles];

    isLoading = false;
    if (articles.isEmpty) isLastPage = true;
  }

  Future<void> toggleFavorite(ArticleEntity article) async {
    await localArticlesRepository.toggleFavorite(article);
    final bool isArticleFavorite = state.contains(article);

    if (isArticleFavorite) {
      state.remove(article);
      state = [...state];
      return;
    }
    state = [...state, article];
  }
}
