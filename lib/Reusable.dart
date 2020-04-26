
import 'package:flutter/material.dart';
class Reusable_Card extends StatelessWidget {
  Reusable_Card({this.CardChild});
  final Widget CardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}