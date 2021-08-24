import 'dart:convert';
import 'dart:io';

import 'package:PigAi/model/Profile.dart';
import 'package:PigAi/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Network {
  final String url = "https://pig-ai.herokuapp.com/users/add";
  final String api;

  Network(this.api);

  Future fetchData() async {
    Response response = await get(Uri.parse(url + api));

    if (response.statusCode == 200) {
      return response;
    } else {
      return response.statusCode;
    }
  }

  Future apiGetRequest(String api) async {
    Map<String, dynamic> decoded;

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url + api));

    if (api != "/auth/login") {
      request.headers.set('content-type', 'application/json');
      request.headers.set('Authorization', 'Bearer ' + Global.token);
    } else {
      request.headers.set('content-type', 'application/json');
    }

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    // String reply = await readResponse(response);
    if (response.statusCode == 200) {
      decoded = jsonDecode(reply) as Map;
    } else {
      decoded = {};
    }
    httpClient.close();

    return decoded;
  }

  Future apiRequest(String api, Map jsonMap) async {
    Map decoded;

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url + api));

    if (api != "/auth/login") {
      request.headers.set('content-type', 'application/json');
      request.headers.set('Authorization', 'Bearer ' + Global.token);
    } else {
      request.headers.set('content-type', 'application/json');
    }

    request.add(utf8.encode(json.encode(jsonMap)));

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    // String reply = await readResponse(response);
    if (response.statusCode == 200) {
      decoded = jsonDecode(reply) as Map;
      // print(decoded['success']);
      print(decoded);
    } else {
      decoded = {};
    }
    httpClient.close();
    return decoded;
  }

  Future logoutAndRefreshTokenRequest(String api) async {
    Map decoded;

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url + api));

    request.headers.set('content-type', 'application/json');
    request.headers.set('Authorization', 'Bearer ' + Global.token);

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    // String reply = await readResponse(response);
    if (response.statusCode == 200) {
      decoded = jsonDecode(reply) as Map;
    } else {
      decoded = {};
    }
    httpClient.close();
    return decoded;
  }

  Future<String> readResponse(HttpClientResponse response) async {
    final contents = StringBuffer();

    await for (var data in response.transform(utf8.decoder)) {
      contents.write(data);
    }

    return contents.toString();
  }
}
