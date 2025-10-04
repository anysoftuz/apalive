import 'package:apalive/data/models/books/books_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LibrartPdfView extends StatelessWidget {
  const LibrartPdfView({super.key, required this.book});
  final BooksModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.name)),
      body: SfPdfViewer.network('https://apipf.dba.uz/uploads/${book.source}'),
    );
  }
}
