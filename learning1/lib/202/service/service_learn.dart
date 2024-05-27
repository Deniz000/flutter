import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning1/202/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _list;
  late Dio _dio;
  final baseUrl = "https://jsonplaceholder.typicode.com/";

  @override
  void initState() {
    //await ve initState() ve get data yı araştır
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    fetchPostItems(); // bunu araştır
  }

  Future<void> fetchPostItems() async {
    final response = await _dio.get("/post");
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _list = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: _list?.length ?? 0,
          itemBuilder: (context, index) {
            return ListCard(model: _list?[index]);
          }),
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
