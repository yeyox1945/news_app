import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/articles/local_repository_provider.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, String title) {
  final localRepository = ref.watch(localRepositoryProvider);
  return localRepository.isArticleFavorite(title);
});
