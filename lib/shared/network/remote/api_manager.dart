import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_own/models/NewsDataModel.dart';
import 'package:news_own/models/SourcesResponse.dart';
import 'package:news_own/shared/constants/constants.dart';

class ApiManager {

  static Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https(BASE, "v2/top-headlines/sources", {
      "apiKey": APIKEY, "category": category
    });
    try {
      http.Response sources = await http.get(url);
      print(sources.statusCode);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsDataModel> getNewsData({String? sourceId, String? queryKeyword}) async{
    Uri url = Uri.https(BASE, "v2/everything", {
      "apiKey": APIKEY,
      "sources": sourceId,
      "q": queryKeyword,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
