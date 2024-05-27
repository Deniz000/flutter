import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning1/202/post_model.dart';

class PostService{
  Dio _dio;
  PostService():_dio= Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  Future<bool> addPost(PostModel postModel) async {
    final response = await _dio.post(PostServicePath.posts.name, data: postModel);

    return response.statusCode == HttpStatus.created;
  }


  Future<List<PostModel>?> fetchPostsItems() async {
    final response = await _dio.get("/posts");

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
         return _datas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum PostServicePath{
  posts, comments
}