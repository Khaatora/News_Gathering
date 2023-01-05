import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_own/models/NewsDataModel.dart';
import 'package:news_own/models/SourcesResponse.dart';
import 'package:news_own/shared/components/component.dart';
import 'package:news_own/shared/constants/constants.dart';

class ApiManager {

  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https(BASE, "v2/top-headlines/sources", {
      "apiKey": APIKEY,
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

  static Future<NewsDataModel> getNewsData(String sourceId) async{
    Uri url = Uri.https(BASE, "v2/everything", {
      "apiKey": APIKEY,
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
