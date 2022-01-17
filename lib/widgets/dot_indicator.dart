import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;
  const DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: isSelected ? Colors.grey : Colors.white,
          shape: BoxShape.circle),
    );
  }
}
