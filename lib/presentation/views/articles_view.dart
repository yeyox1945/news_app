import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/articles/remote_pagination_provider.dart';
import 'package:news_app/presentation/providers/articles/remote_stream_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final articles = ref.watch(articlesProvider);
    // final streamData = ref.watch(streamProvider);

    // return streamData.when(
    //   data: (data) {
    //     return FutureBuilder(
    //       future: data,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return ArticlesListView(
    //             articles: snapshot.data!,
    //             loadNextPage: ref.read(articlesProvider.notifier).loadNextPage,
    //           );
    //         }
    //         return ArticlesListView(
    //           articles: articles,
    //           loadNextPage: ref.read(articlesProvider.notifier).loadNextPage,
    //         );
    //       },
    //     );
    //   },
    //   error: (error, stackTrace) => throw UnimplementedError(),
    //   loading: () => const SizedBox(),
    // );

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
