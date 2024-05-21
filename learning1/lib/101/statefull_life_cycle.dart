import "package:flutter/material.dart";

class SFullLifeCycleLearn extends StatefulWidget {
  const SFullLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<SFullLifeCycleLearn> createState() => _SFullLifeCycleLearnState();
}

class _SFullLifeCycleLearnState extends State<SFullLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SFullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      //devamında da setState ile güncelleyeceksin, Yani render edilme işlemine bak,
      //olacasa güncelle yoksa çalışma. slay bi metot yani agjdjlas
    }
  }

  @override
  void dispose() { // SAYFADAN ÇIKTIĞINDA, SAYFA ÖLDÜĞÜNDE ÇALIŞTIRR <3<<3<3<3
    super.dispose(); 
  }
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _isOdd ? _message = "Tek" : _message = "Çift";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message.toString()),
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message.toString()))
          : ElevatedButton(onPressed: () {}, child: Text(_message.toString())),
    );
  }
}
