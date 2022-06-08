import 'package:algolearn/data/data.dart';
import 'package:epub_view/epub_view.dart' as epub;
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key, required this.item}) : super(key: key);

  final Article item;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late epub.EpubController epubController;

  @override
  void initState() {
    super.initState();
    epubController = epub.EpubController(
        document: epub.EpubDocument.openAsset(widget.item.content));
  }

  @override
  void dispose() {
    epubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.white.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_backspace, color: Colors.white),
        ),
        title: Text(
          widget.item.title,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          if (widget.item.url != null)
            Container(
              height: 200,
              color: Colors.white,
              child: Image.asset(
                widget.item.url!,
                fit: BoxFit.fitHeight,
              ),
            ),
          Expanded(
            child: epub.EpubView(
              builders: epub.EpubViewBuilders<epub.DefaultBuilderOptions>(
                options: const epub.DefaultBuilderOptions(),
                chapterDividerBuilder: (_) => const Divider(),
              ),
              controller: epubController,
            ),
          ),
        ],
      ),
    );

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leading: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
              primary: Colors.white.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_backspace, color: Colors.white),
          ),
          title: Text(
            widget.item.title,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        if (widget.item.url != null)
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.white,
              child: Image.network(
                widget.item.url!,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        SliverFillRemaining(
          child: epub.EpubView(
            builders: const epub.EpubViewBuilders<epub.DefaultBuilderOptions>(
                options: epub.DefaultBuilderOptions()),
            controller: epubController,
          ),
        ),
      ],
    );
  }
}
