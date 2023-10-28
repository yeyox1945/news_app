import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/domain/entities/article_entity.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 17);

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
            onPressed: () => {},
            icon: const Icon(Icons.favorite_outline_rounded),
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
              Image.network(article.imageUrl),
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
