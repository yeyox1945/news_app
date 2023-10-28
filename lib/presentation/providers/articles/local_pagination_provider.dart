import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/articles/local_repository.dart';
import 'package:news_app/presentation/providers/articles/local_repository_provider.dart';

final localArticlesProvider = StateNotifierProvider<ArticlesNotifier, List<ArticleEntity>>((ref) {
  final localRepository = ref.watch(localRepositoryProvider);

  return ArticlesNotifier(localArticlesRepository: localRepository);
});

class ArticlesNotifier extends StateNotifier<List<ArticleEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  final LocalArticlesRepository localArticlesRepository;

  ArticlesNotifier({required this.localArticlesRepository}) : super([]);

  Future<List<ArticleEntity>> loadNextPage() async {
    if (isLoading) return [];

    isLoading = true;
    currentPage++;
    final List<ArticleEntity> articles =
        await localArticlesRepository.loadArticles(offset: currentPage * 10, limit: 10);
    state = [...state, ...articles];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;

    return articles;
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
