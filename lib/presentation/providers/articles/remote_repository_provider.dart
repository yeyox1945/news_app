import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/datasources/articles/remote_datasource.dart';
import 'package:news_app/data/repositories/articles/remote_repository_impl.dart';

final remoteRepositoryProvider = Provider<ArticlesRepositoryImpl>(
  (ref) => ArticlesRepositoryImpl(
    datasource: RemoteArticlesDatasource(),
  ),
);
