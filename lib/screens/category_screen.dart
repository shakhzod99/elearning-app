import 'package:algolearn/data/data.dart';
import 'package:algolearn/screens/article_screen.dart';
import 'package:algolearn/utils/const.dart';
import 'package:algolearn/widgets/card_courses.dart';
import 'package:algolearn/widgets/header_inner.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  final MapEntry<Category, List<Article>> category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final category = widget.category.key;
  late final articles = widget.category.value;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: TextButton(
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
                  child:
                      const Icon(Icons.keyboard_backspace, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          const HeaderInner(),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 3),
              Center(
                child: Text(
                  widget.category.key.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding * 2),
              Container(
                height: MediaQuery.of(context).size.height -
                    Constants.mainPadding * 10,
                padding: EdgeInsets.fromLTRB(
                    Constants.mainPadding,
                    Constants.mainPadding * 2,
                    Constants.mainPadding,
                    Constants.mainPadding),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.0)),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final item = articles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleScreen(item: item)),
                        );
                      },
                      child: CardCourses(
                        image: Icon(category.icon),
                        color: category.color,
                        title: item.title,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
