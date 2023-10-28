import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/articles/local_pagination_provider.dart';
import 'package:news_app/presentation/widgets/articles_list_view.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin {
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    ref.read(localArticlesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLastPage) return;

    final articles = await ref.read(localArticlesProvider.notifier).loadNextPage();

    if (articles.isEmpty) isLastPage = true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final articles = ref.watch(localArticlesProvider);

    return ArticlesListView(
      articles: articles,
      loadNextPage: loadNextPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
