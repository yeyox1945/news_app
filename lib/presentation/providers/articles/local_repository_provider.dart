import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/datasources/articles/local_datasource.dart';
import 'package:news_app/data/repositories/articles/local_repository_impl.dart';

final localRepositoryProvider = Provider<LocalArticlesRepositoryImpl>(
  (ref) => LocalArticlesRepositoryImpl(
    datasource: LocalArticlesDatasource(),
  ),
);
