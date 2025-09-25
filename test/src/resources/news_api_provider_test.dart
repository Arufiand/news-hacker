import 'package:news_learning/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds return a list of ids', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });
  test('fetchItem return an ItemModel instance', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {
        'id': 123,
        'deleted': false,
        'type': 'story',
        'by': 'testuser',
        'time': 1678886400,
        'text': 'This is a test story.',
        'dead': false,
        'parent': 1,
        'kids': [],
        'url': 'http://test.com',
        'score': 100,
        'title': 'Test Title',
        'descendants': 5,
      };
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);

    expect(item.id, 123);
    expect(item.deleted, false);
  });
}
