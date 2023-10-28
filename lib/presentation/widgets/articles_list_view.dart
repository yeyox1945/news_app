import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class ArticlesListView extends StatefulWidget {
  const ArticlesListView({
    super.key,
    required this.articles,
    this.loadNextPage,
  });

  final List<ArticleEntity> articles;
  final VoidCallback? loadNextPage;

  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 100) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.articles.length,
      itemBuilder: (BuildContext context, int index) {
        final article = widget.articles[index];

        return _ArticleTile(article: article);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class _ArticleTile extends StatelessWidget {
  const _ArticleTile({
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/article', extra: article),
      child: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(article.description),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  article.source,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
