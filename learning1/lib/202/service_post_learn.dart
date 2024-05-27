import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning1/202/post_model.dart';
import 'package:learning1/202/post_service.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  List<PostModel>? _list;
  bool isLoading = false;

  late final PostService _postService;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    //await ve initState() ve get data yı araştır
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    changeLoading();
    _list = await _postService.fetchPostsItems();
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListCard(model: _list?[0]),
    );
    // PostForm(titleController: _titleController, bodyController: _bodyController, idController: _idController, isLoading: isLoading));
  }
}

class PostForm extends StatelessWidget {
  const PostForm({
    super.key,
    required TextEditingController titleController,
    required TextEditingController bodyController,
    required TextEditingController idController,
    required this.isLoading,
  })  : _titleController = titleController,
        _bodyController = bodyController,
        _idController = idController;

  final TextEditingController _titleController;
  final TextEditingController _bodyController;
  final TextEditingController _idController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(label: Text("Title")),
        ),
        TextField(
          textInputAction: TextInputAction.next,
          controller: _bodyController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(label: Text("Body")),
        ),
        TextField(
          textInputAction: TextInputAction.next,
          controller: _idController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(label: Text("UserID")),
        ),
        TextButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_bodyController.text.isNotEmpty &&
                        _titleController.text.isNotEmpty &&
                        _idController.text.isNotEmpty) {
                      final model = PostModel(
                          body: _bodyController.text,
                          title: _titleController.text,
                          id: int.tryParse(_idController.text));
                    }
                  },
            child: const Text("send"))
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.circle),
        title: Text(
          _model?.title ?? "",
          style: const TextStyle(color: Colors.lightBlueAccent),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_model?.body ?? ""),
          ],
        ),
      ),
    );
  }
}
