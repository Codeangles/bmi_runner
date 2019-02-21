import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home>{
  TextEditingController _Age = new TextEditingController();
  TextEditingController _Height = new TextEditingController();
  TextEditingController _Weight = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";


  void _submit(){
    setState(() {
      int age = int.parse(_Age.text);
      double height = double.parse(_Height.text);
      inches = height*12;
      double weight = double.parse(_Weight.text);

      if ((_Age.text.isNotEmpty || age > 0)
          && ((_Height.text.isNotEmpty || inches > 0)
              && (_Weight.text.isNotEmpty || weight > 0))) {
        result = (weight*2.205) / (inches * inches) * 703; // our BMI

        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);

        }else if (double.parse(result.toStringAsFixed(1)) >= 18.5
            && result < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30) {
          _resultReading = "Overweight";
        }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }





      }else {
        result = 0.0;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Caluclator"),
        backgroundColor: Colors.blueGrey,
      ),
      body: new ListView(
        padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
            child: Image.asset(
              "images/bmilogo.png",
              width: 90.0,
              height: 90.0,
            ),
          ),


            new Container(
              margin: new EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
              padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              width: 380.0,
              height: 300.0,
              color: Colors.blueGrey.shade200,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _Weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      hintText: '52',
                      labelText: 'Enter your Weight',


                    ),
                  ),

                  new TextField(
                    controller: _Age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      hintText: '24',
                      labelText: 'Enter your Age',


                    ),
                  ),

                  new TextField(
                    controller: _Height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //border: InputBorder.none,
                      hintText: '5.5',
                      labelText: 'Enter your Height',


                    ),
                  ),

//                new TextField(
//                  controller: _Weight,
//                  keyboardType: TextInputType.number,
//                  decoration: InputDecoration(
//                    //border: InputBorder.none,
//                    hintText: 'Please enter a search term',
//                    labelText: 'Enter your username',
//                    //icon: Icon(Icons.person),
//
//                  ),
//                ),

                  new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    child: new FlatButton(
                        color: Colors.pinkAccent,
                        onPressed: _submit,
                        child: new Text(
                          "Submit",
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),

            new Container(
              margin: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              alignment: Alignment.center,
              child: new Text(
                "$_resultReading",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500
                ),
              ),
            )

          
          ],
      ),
    );
  }

}