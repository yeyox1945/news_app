import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/providers/articles/local_is_favorite_provider.dart';
import 'package:news_app/presentation/providers/articles/local_pagination_provider.dart';

class ArticleDetailScreen extends ConsumerWidget {
  const ArticleDetailScreen({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(fontSize: 17);

    final isFavoriteFuture = ref.watch(isFavoriteProvider(article.title));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Article'),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(localArticlesProvider.notifier).toggleFavorite(article);
              ref.invalidate(isFavoriteProvider(article.title));
            },
            icon: isFavoriteFuture.when(
              data: (isFavorite) => isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border_rounded),
              error: (error, stackTrace) => throw UnimplementedError(),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                maxLines: 3,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.network(
                article.imageUrl,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Description:'),
              Text(
                article.description,
                style: textStyle,
              ),
              const SizedBox(height: 20),
              const Text('Content:'),
              Text(
                article.content,
                style: textStyle,
              ),
              const SizedBox(height: 20),
              Text(
                article.source,
                style: const TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              Text(article.publishedAt),
            ],
          ),
        ),
      ),
    );
  }
}
