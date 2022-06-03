import 'package:algolearn/utils/const.dart';
import 'package:algolearn/widgets/card_courses.dart';
import 'package:algolearn/widgets/header_inner.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                child: FlatButton(
                  padding: const EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Icon(Icons.keyboard_backspace, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: FlatButton(
                  padding: const EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    debugPrint("Menu Pressed");
                  },
                  child: const Icon(Icons.menu, color: Colors.white),
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
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 3),
              const Center(
                child: Text(
                  "UI/UX\nCourses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding * 2),
              Container(
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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CardCourses(
                      image: Image.asset("assets/images/icon_1.png",
                          width: 40, height: 40),
                      color: Constants.lightPink,
                      title: "Adobe XD Prototyping",
                      hours: "10 hours, 19 lessons",
                      progress: "25%",
                      percentage: 0.25,
                    ),
                    CardCourses(
                      image: Image.asset("assets/images/icon_2.png",
                          width: 40, height: 40),
                      color: Constants.lightYellow,
                      title: "Sketch shortcuts and tricks",
                      hours: "10 hours, 19 lessons",
                      progress: "50%",
                      percentage: 0.5,
                    ),
                    CardCourses(
                      image: Image.asset("assets/images/icon_3.png",
                          width: 40, height: 40),
                      color: Constants.lightViolet,
                      title: "UI Motion Design in After Effects",
                      hours: "10 hours, 19 lessons",
                      progress: "75%",
                      percentage: 0.75,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
