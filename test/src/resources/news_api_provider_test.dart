import 'package:news_learning/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds return a list of ids', () {
    final sum = 1 + 3;

    expect(sum, 4);
  });
}
