import 'dart:convert';
import 'dart:developer';

import 'package:flutter_camp_1/models/post/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteClient {
  const RemoteClient(this.client);

  final http.Client client;

  Future<List<Post>?> get() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        final posts = body.map((e) => Post.fromJson(e)).toList();
        return posts;
      } else {
        log('${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('$e');
      client.close();
      return null;
    }
  }
}
