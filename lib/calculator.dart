import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi;

  String bmiCalculator(){
    _bmi=weight /pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25){
      return 'overweight';
    }else if(_bmi>18.5){
      return'Normal';
    }
    else{
      return'UnderWeight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'overweight.please do some exercise cause you are ugly';
    }else if(_bmi>18.5){
      return'Normal.looks like you are fit';
    }
    else{
      return'UnderWeight.please gain some weight.you are skinny';
    }

  }
}