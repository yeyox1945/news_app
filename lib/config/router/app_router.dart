import 'package:go_router/go_router.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/screens/articles/article_detail_screen.dart';
import 'package:news_app/presentation/screens/articles/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final int pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
      // routes: [
      //   GoRoute(
      //     path: 'article',
      //     builder: (context, state) {
      //       final article = state.extra as ArticleEntity;

      //       return ArticleDetailScreen(article: article);
      //     },
      //   ),
      // ],
    ),
    GoRoute(
      path: '/article',
      builder: (context, state) {
        final article = state.extra as ArticleEntity;

        return ArticleDetailScreen(article: article);
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
