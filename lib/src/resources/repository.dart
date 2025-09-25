import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();

  fetchTopIds() {
    return apiProvider.fetchTopId();
  }

  // Check first if the ID from the fetchTopId is on the SQLite or not
  fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }
    // if Cached item on SQLite is not found, then fetch the item and save it to the database
    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);

    // return the item
    return item;
  }
}
