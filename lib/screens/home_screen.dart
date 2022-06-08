import 'package:algolearn/data/data.dart';
import 'package:algolearn/screens/category_screen.dart';
import 'package:algolearn/utils/const.dart';
import 'package:algolearn/widgets/card_courses.dart';
import 'package:algolearn/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchControl = TextEditingController();
  FocusNode? myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode?.dispose();
    super.dispose();
  }

  final categories = data.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          const Header(),
          Padding(
            padding: EdgeInsets.only(
              right: Constants.mainPadding,
              left: Constants.mainPadding,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: Constants.mainPadding * 2),

                // 1. Welcome User
                const Text(
                  "Welcome back\nStudent!",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),

                SizedBox(height: Constants.mainPadding),

                // 3. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color(0xFFFEF3F3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Start Learning \nNew Stuff!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textDark),
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),

                    // Image Researching Girl
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/researching.png",
                        width: 200,
                        height: 104,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),

                Text("Courses in progress",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),

                const SizedBox(height: 20.0),

                // List of courses
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen(category: item)),
                        );
                      },
                      child: CardCourses(
                        image: Icon(item.key.icon),
                        title: item.key.title,
                        color: item.key.color,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
