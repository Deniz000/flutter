import 'package:flutter/material.dart';
import 'package:learning1/202/service/comments_learn.dart';
import 'package:learning1/202/service/post_model.dart';
import 'package:learning1/202/service/post_service.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  List<PostModel>? _list;
  bool isLoading = false;

  late final IPostService _postService;

  // ignore: unused_field
  final TextEditingController _titleController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _bodyController = TextEditingController();
  // ignore: unused_field
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
    _postService = PostService();
    fetchData();
  }

  Future<void> fetchData() async {
    changeLoading();
    _list = await _postService.fetchPostsItems();
    changeLoading();
  }

  Future<void> addData(PostModel model) async {
    changeLoading();
    await _postService.addPost(model);
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: _list?.length ?? 0,
        itemBuilder: (context, index) {
          return ListCard(model: _list?[index]);
        },
      ),
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
    required this.onSubmit,
    required this.isLoading,
  })  : _titleController = titleController,
        _bodyController = bodyController,
        _idController = idController;

  final TextEditingController _titleController;
  final TextEditingController _bodyController;
  final TextEditingController _idController;
  final bool isLoading;
  final Function(PostModel) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(label: Text("Title")),
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
                      onSubmit(model);
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(postId: _model?.id)));
        },
        leading: const Icon(
          Icons.wb_cloudy_sharp,
          color: Colors.green,
        ),
        title: Text(
          _model?.title ?? "",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
