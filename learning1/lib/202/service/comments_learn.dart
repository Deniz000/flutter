import 'package:flutter/material.dart';
import 'package:learning1/202/service/comment_model.dart';
import 'package:learning1/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService _postService;
  List<CommentModel>? _comments;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postService = PostService();
    fetchItemByPostId(widget.postId ?? 0);
  }

  Future<void> fetchItemByPostId(int postId) async {
    changeLoading();
    _comments = await _postService.fetchCommentsByPostId(postId);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _comments?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.power_settings_new_outlined),
              title: Text("${_comments?[index].body}"),
            );
          }),
    );
  }
}
