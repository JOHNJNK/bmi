import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

 Green : 12a644
 Grey : 403f3d

 */
void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Color(0xFF12a644)),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=100.0;
  double _weight=45.0;
  double _bmi=0.0;
  String _condition="";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.40,
                width: double.infinity,
                decoration: new BoxDecoration(color: Color(0xFF12a644)),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BMI",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0),
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "$_bmi",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Condition : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                            children: <TextSpan>[
                          TextSpan(
                              text: "$_condition",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ))
                        ]))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.01,),
                    Text("Choose Data",
                      style: TextStyle(
                        color: Color(0xFF12a644),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    RichText(
                        text: TextSpan(
                            text: "Height : ",
                            style: TextStyle(
                              color: Color(0xFF403f3d),
                              fontSize: 25.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "$_height cm",
                                  style: TextStyle(
                                    color: Color(0xFF403f3d),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                    SizedBox(height: size.height*0.02,),
                    Slider(
                      value: _height,
                      min: 0,
                      max: 250,
                      onChanged: (height){
                        setState(() {
                          _height=height;
                        });
                      },
                      divisions: 250,
                      label: "$_height",
                      activeColor: Color(0xFF403f3d),
                      inactiveColor: Colors.grey,
                    ),
                    SizedBox(height: size.height*0.03,),
                    RichText(
                        text: TextSpan(
                            text: "Weight : ",
                            style: TextStyle(
                              color: Color(0xFF403f3d),
                              fontSize: 25.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "$_weight Kg",
                                  style: TextStyle(
                                    color: Color(0xFF403f3d),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                    SizedBox(height: size.height*0.02,),
                    Slider(
                      value: _weight,
                      min: 0,
                      max: 250,
                      onChanged: (weight){
                        setState(() {
                          _weight=weight;
                        });
                      },
                      divisions: 250,
                      label: "$_weight",
                      activeColor: Color(0xFF403f3d),
                      inactiveColor: Colors.grey,
                    ),
                    SizedBox(height: size.height*0.01,),
                    Container(
                      width: size.width*0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: FlatButton(
                          onPressed: (){
                            setState(() {
                              //18.5-25 Healthy 25-30 OverWeight >30 Obesity <18.5 UnderWeight
                              _bmi=(_weight/((_height/100)*(_height/100))).roundToDouble();
                              if(_bmi>=18.5&&_bmi<26) {_condition="Normal";}
                              else if(_bmi>=26&&_bmi<31) {_condition="OverWeight";}
                              else if(_bmi<=18.4) {_condition="UnderWeight";}
                              else {_condition="Obesity";}
                            });
                          },
                          child: Text("Calculate",
                            style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0,
                          ),),
                          color: Color(0xFF12a644),
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
