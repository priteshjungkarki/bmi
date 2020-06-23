import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/button_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender{
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=20;


  //Color maleactivecolor=inactiveCardColor;
  //Color femaleactivecolor=inactiveCardColor;
  //void updateColor(Gender selectedgender){
    //male pressed change state
  //  if(selectedgender==Gender.male){
    //  if(maleactivecolor==inactiveCardColor){
  //      maleactivecolor=activeCardColor;
   //     femaleactivecolor=inactiveCardColor;
   //   }
  //    else{
  //      maleactivecolor=inactiveCardColor;
    //  }
   // }
   // //female pressed changed state
   // if(selectedgender==Gender.female){
   //   if(femaleactivecolor == inactiveCardColor){
    //    femaleactivecolor=activeCardColor;
    //    maleactivecolor=inactiveCardColor;
    //  }
  //    else{
    //    femaleactivecolor=inactiveCardColor;
  //    }
    //}
 // }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          //first row first part
          Expanded(
            child: Row(
              children: <Widget>[
                //first row first part
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    color: selectedGender==Gender.male ? kactiveCardColor : kinactiveCardColor ,
                    cardChild: IconContent(icon:FontAwesomeIcons.mars,label: 'Male'),
                  ),
                ),

                //first row second part
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                  color: selectedGender==Gender.female ? kactiveCardColor : kinactiveCardColor ,
                  cardChild: IconContent(icon:FontAwesomeIcons.venus,label: 'Female'),
                ),
                ),
              ],
            ),
          ),

          //second row
          Expanded(
            child: ReusableCard(
            color: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text(
                      'Height',
                    style: kLabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: knumbertextstyle,
                      ),
                      Text(
                      'cm',
                        style: kLabeltextstyle,
                      ),
                    ],
                  ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0xFFEB1555),
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 10.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220.0,
                      min: 120.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),

          ),
          ),

          //third row first part
          Expanded(child: Row(
            children: <Widget>[
              //third row first part
              Expanded(
                child: ReusableCard(
                color: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: kLabeltextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           RoundIconButton(
                             onpressed: (){
                               setState(() {
                                 weight--;
                               });
                             },
                             icon: FontAwesomeIcons.minus,
                          ),
                          
                          SizedBox(
                            width: 15.0,
                          ),
                           RoundIconButton(
                             onpressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                             icon: FontAwesomeIcons.plus,
                           ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
              //third row second part
              Expanded(
                child: ReusableCard(
                color: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: kLabeltextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            onpressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
              ),
            ],
          ),
          ),
          ButtonButton(
            buttontitle: 'Calculate',
            ontap: (){
              CalculatorBrain cal= CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
                resulttext: cal.getResult(),
                bmiresult: cal.bmiCalculator(),
                getinterpetation: cal.getInterpretation(),
              ),
              ),
              );
            },
          )
        ],

      ),
    );
  }
}



