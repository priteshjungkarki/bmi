import "package:flutter/material.dart";

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.color,this.cardChild,this.onpress});
  final  Color color;
  final Widget cardChild;
  final Function onpress;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        height: 200.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
