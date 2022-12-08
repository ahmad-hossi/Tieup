import 'package:flutter/material.dart';

class OrText extends StatelessWidget {
  const OrText({Key? key, this.text = 'OR'}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: const Divider(
            color: Colors.black,
          ),
        ),
      ),
      Text(text),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: const Divider(
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }
}
