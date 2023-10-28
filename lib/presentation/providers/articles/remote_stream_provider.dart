import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/presentation/providers/articles/remote_pagination_provider.dart';

final streamProvider = StreamProvider((ref) {
  return Stream.periodic(
    const Duration(seconds: 10),
    (computationCount) => ref.read(articlesProvider.notifier).refresh(),
  );
});
