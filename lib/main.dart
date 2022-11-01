
import 'package:calculator/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(home: Calculator()));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double firstnum=0.0;
    double secondnum=0.0;
    var input="";
    var Ouptut="";
    var buttonoperation="";
    var hideinput=false;
    var outputsize=34.0;
  
  
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text(
                    hideinput ? "":
                    input,
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Ouptut,
                    style: TextStyle(fontSize: outputsize, color: Colors.white.withOpacity(.8)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(text: "Ac", bgcolor: operstorcolor, textcolor: orangcolor),
              button(text: "<", bgcolor: operstorcolor, textcolor: orangcolor),
              button(text: "", bgcolor: Colors.transparent),
              button(text: "/", bgcolor: operstorcolor, textcolor: orangcolor),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(
                text: "9",
              ),
              button(text: "x", bgcolor: operstorcolor, textcolor: orangcolor),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(
                text: "6",
              ),
              button(text: "-", bgcolor: operstorcolor, textcolor: orangcolor),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(
                text: "3",
              ),
              button(text: "+", bgcolor: operstorcolor, textcolor: orangcolor),
            ],
          ),
          Row(
            children: [
              button(text: "%", bgcolor: operstorcolor, textcolor: orangcolor),
              button(text: "0"),
              button(
                text: ".",
              ),
              button(text: "=", bgcolor: orangcolor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, textcolor = Colors.white, bgcolor = buttoncolor}) {
    return Expanded(
      child: Container(
        margin:  EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: ()=>onbuttonclick(text),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(22),
              primary: bgcolor),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
  onbuttonclick(value) {
    if (value=='Ac'){
       input='';
       Ouptut='';

    }
    else if(value=='<'){
      if(input.isNotEmpty)
      input=input.substring(0,input.length-1);
    
    }
    else if(value== "="){
      if(input.isNotEmpty){
      var userinput=input;
      
      userinput=input.replaceAll("x", '*');
      Parser p=Parser();
      Expression expression=p.parse(userinput);
      ContextModel cm=ContextModel();
      var finalvalue=expression.evaluate(
        EvaluationType.REAL,
        cm
      );
      Ouptut=finalvalue.toString();
      if(Ouptut.endsWith(".0")){
        Ouptut=Ouptut.substring(0,Ouptut.length-2);
      }
      input=Ouptut;
      hideinput=true;
      outputsize=50;
      }
    }
    else{
      input=input+value;
      hideinput=false;
      outputsize=34.0;
      
    } 
    setState(() {
    });
}
}