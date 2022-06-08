import 'package:algolearn/utils/const.dart';
import 'package:flutter/material.dart';

class CardCourses extends StatelessWidget {
  final Widget image;
  final String title;
  final Color color;

  const CardCourses({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      child: Row(
        children: <Widget>[
          image,
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Constants.textDark),
            ),
          ),
        ],
      ),
    );
  }
}
