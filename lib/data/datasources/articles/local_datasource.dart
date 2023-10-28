import 'package:news_app/domain/datasources/articles/local_datasource.dart';
import 'package:isar/isar.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:path_provider/path_provider.dart';

class LocalArticlesDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  LocalArticlesDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ArticleEntitySchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isArticleFavorite(int articleId) async {
    final isar = await db;

    final ArticleEntity? favoriteArticle = await isar.articleEntitys.filter().idEqualTo(articleId).findFirst();

    return favoriteArticle != null;
  }

  @override
  Future<void> toggleFavorite(ArticleEntity article) async {
    final isar = await db;

    final favoriteArticle = await isar.articleEntitys.filter().idEqualTo(article.id).findFirst();

    // Delete from db
    if (favoriteArticle != null) {
      isar.writeTxnSync(() => isar.articleEntitys.deleteSync(favoriteArticle.id));
      return;
    }

    // Insert to db
    isar.writeTxnSync(() => isar.articleEntitys.putSync(article));
  }

  @override
  Future<List<ArticleEntity>> loadArticles({int limit = 10, int offset = 0}) async {
    final isar = await db;

    return isar.articleEntitys.where().offset(offset).limit(limit).findAll();
  }
}
