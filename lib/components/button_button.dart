import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class ButtonButton extends StatelessWidget {

  ButtonButton({@required this.ontap,this.buttontitle});
  final Function ontap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Text(
          buttontitle,
          style: kcontainertextstyle,
        ),
        padding: EdgeInsets.only(left: 100.0,top: 10.0,),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBootomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
