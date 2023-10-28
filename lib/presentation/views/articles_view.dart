import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/articles/articles_providers.dart';
import 'package:news_app/presentation/widgets/articles_list_view.dart';

class ArticlesView extends ConsumerStatefulWidget {
  const ArticlesView({super.key});

  @override
  ConsumerState<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends ConsumerState<ArticlesView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    ref.read(articlesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final articles = ref.watch(articlesProvider);

    return ArticlesListView(
      articles: articles,
      loadNextPage: ref.read(articlesProvider.notifier).loadNextPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
