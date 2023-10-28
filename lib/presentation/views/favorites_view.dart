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
  @override
  void initState() {
    super.initState();

    ref.read(localArticlesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final articles = ref.watch(localArticlesProvider);

    return ArticlesListView(
      articles: articles,
      loadNextPage: ref.read(localArticlesProvider.notifier).loadNextPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
