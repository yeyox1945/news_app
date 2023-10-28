import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/datasources/articles/local_articles_datasource.dart';
import 'package:news_app/data/datasources/articles/remote_articles_datasource.dart';
import 'package:news_app/data/repositories/articles/articles_repository_impl.dart';

final remoteRepositoryProvider = Provider<ArticlesRepositoryImpl>(
  (ref) => ArticlesRepositoryImpl(
    datasource: RemoteArticlesDatasource(),
  ),
);

final localRepositoryProvider = Provider<ArticlesRepositoryImpl>(
  (ref) => ArticlesRepositoryImpl(
    datasource: LocalArticlesDatasource(),
  ),
);
