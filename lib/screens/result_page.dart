import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/button_button.dart';

class ResultPage  extends StatelessWidget {

  ResultPage({@required this.bmiresult,@required this.resulttext,@required this.getinterpetation});

  final String bmiresult;
  final String resulttext;
  final String getinterpetation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style:ktitletextstyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                color: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resulttext.toUpperCase(),
                    style: kresulttextstyle,
                  ),
                  Text(
                    bmiresult,
                    style: kbmittextstyle,
                  ),
                  Text(
                    getinterpetation,
                    textAlign: TextAlign.center,
                    style: kbodytextstyle,
                  ),
                ],
              ),
            ),
          ),
          ButtonButton(
            buttontitle: 'Re-calculate',
            ontap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
