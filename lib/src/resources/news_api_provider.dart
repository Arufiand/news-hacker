import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:news_learning/src/models/item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopId() async {
    final response = await client.get('$_root/topstories.json' as Uri);
    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json' as Uri);
    final parser = json.decode(response.body);

    return ItemModel.fromJson(parser);
  }
}
