import 'dart:io';

import 'package:learning1/202/custom_exception.dart';

class FileDownload {
  void downloadItem(FileItem? item) {
    if (item == null) throw FileDownloadException();

    print("a");
  }
}

class FileItem {
  final String name;
  final File file;
  FileItem(this.name, this.file);
}
