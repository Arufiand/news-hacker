import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:news_learning/src/models/item_model.dart';
import 'package:news_learning/src/resources/repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    final response = await client.get(Uri.parse('$_root/topstories.json'));
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parser = json.decode(response.body);

    return ItemModel.fromJson(parser);
  }
}
