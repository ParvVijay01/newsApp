import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class NewsData {
  static Future<List<dynamic>> loadNewsData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> newsList = json.decode(jsonString)['news'];
    return newsList;
  }
}
