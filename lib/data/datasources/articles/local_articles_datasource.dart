// import 'package:news_app/domain/datasources/local_articles_datasource.dart';
// import 'package:isar/isar.dart';
// import 'package:news_app/domain/entities/article_entity.dart';
// import 'package:path_provider/path_provider.dart';

// class IsarDatasource extends LocalStorageDatasource {
//   late Future<Isar> db;

//   IsarDatasource() {
//     db = openDB();
//   }

//   Future<Isar> openDB() async {
//     final dir = await getApplicationDocumentsDirectory();
//     if (Isar.instanceNames.isEmpty) {
//       return await Isar.open([MovieSchema], directory: dir.path, inspector: true);
//     }
//     return Future.value(Isar.getInstance());
//   }

//   @override
//   Future<bool> isMovieFavorite(int movieId) async {
//     final isar = await db;

//     final Movie? favoriteMovie = await isar.movies.filter().idEqualTo(movieId).findFirst();

//     return favoriteMovie != null;
//   }

//   @override
//   Future<void> toggleFavorite(Movie movie) async {
//     final isar = await db;

//     final favoriteMovie = await isar.movies.filter().idEqualTo(movie.id).findFirst();

//     // Delete from db
//     if (favoriteMovie != null) {
//       isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
//       return;
//     }

//     // Insert to db
//     isar.writeTxnSync(() => isar.movies.putSync(movie));
//   }

//   @override
//   Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
//     final isar = await db;

//     return isar.movies.where().offset(offset).limit(limit).findAll();
//   }
// }
