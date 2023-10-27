import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final int pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
