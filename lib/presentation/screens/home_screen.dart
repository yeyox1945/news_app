import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/presentation/views/articles/articles_view.dart';
import 'package:news_app/presentation/views/articles/favorites_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> viewRoutes = const [
    ArticlesView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('News app'),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.pageIndex,
        onTap: (value) => context.go('/home/$value'),
        items: const [
          BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article_outlined)),
          BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite_border_outlined)),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
