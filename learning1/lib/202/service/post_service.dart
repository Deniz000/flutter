import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning1/202/service/comment_model.dart';
import 'package:learning1/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addPost(PostModel postModel);
  Future<bool> putItem(PostModel postModel, int id);
  Future<bool> deleteItem(int id);
  Future<List<PostModel>?> fetchPostsItems();
  Future<List<CommentModel>?> fetchCommentsByPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addPost(PostModel postModel) async {
    try {
      final response =
          await _dio.post(PostServicePath.posts.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> putItem(PostModel postModel, int id) async {
    try {
      final response =
          await _dio.put('${PostServicePath.posts.name}/$id', data: postModel);
      return response.statusCode == HttpStatus.created;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteItem(int id) async {
    try {
      final response = await _dio.delete('${PostServicePath.posts.name}/$id');
      return response.statusCode == HttpStatus.created;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostsItems() async {
    try {
      final response = await _dio.get(PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final dataList = response.data;
        if (dataList is List) {
          return dataList.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (e) {}
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchCommentsByPostId(int postId) async {
    try {
      final response = await _dio.get(PostServicePath.comments.name,
          queryParameters: {'postId': postId});

      if (response.statusCode == HttpStatus.ok) {
        final commentlist = response.data;
        if (commentlist is List) {
          return commentlist
              .map((comment) => CommentModel.fromJson(comment))
              .toList();
        }
      }
    } catch (e) {}
      return null;
  }
}

enum PostServicePath { posts, comments }
