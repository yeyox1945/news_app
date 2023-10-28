import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/isolates/articles/background_articles_isolate.dart';
import 'package:news_app/presentation/providers/articles/remote_pagination_provider.dart';
import 'package:news_app/presentation/widgets/articles_list_view.dart';

class ArticlesView extends ConsumerStatefulWidget {
  const ArticlesView({super.key});

  @override
  ConsumerState<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends ConsumerState<ArticlesView> with AutomaticKeepAliveClientMixin {
  late final Stream stream;

  @override
  void initState() {
    super.initState();

    ref.read(articlesProvider.notifier).loadNextPage();

    final receivePort = ReceivePort();
    FlutterIsolate.spawn(getNewArticlesBackground, receivePort.sendPort);
    receivePort.listen(
      (message) {
        ref.read(articlesProvider.notifier).refresh();
      },
    );
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
