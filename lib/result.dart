import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Result extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultState();
  }
}

class _ResultState extends State<Result> {
  String gender = "";
  double height = 0;
  int weight = 0;
  int age = 0;
  double BMI = 0;
  final List<String> _resultList = [
    "UnderWeight",
    "Normal",
    "OverWeight",
    "Obese",
    "Extremely Obese",
  ];
  String _result = "";
  final TextStyle _textStyle = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500);

  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      gender = _pref.getString("gender")!;
      height = _pref.getDouble("height")!;
      weight = _pref.getInt("weight")!;
      age = _pref.getInt("age")!;
      BMI = weight / ((height / 100) * (height / 100));
      if (BMI > 35) {
        _result = _resultList[4];
      } else if (BMI >= 30) {
        _result = _resultList[3];
      } else if (BMI >= 25) {
        _result = _resultList[2];
      } else if (BMI >= 18.5) {
        _result = _resultList[1];
      } else {
        _result = _resultList[0];
      }
    });
  }

  deleteData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("gender");
    _pref.remove("height");
    _pref.remove("weight");
    _pref.remove("age");
  }

  @override
  void dispose() {
    super.dispose();
    deleteData();
  }

  info(String s, TextStyle myTextStyle) {
    return Container(
      //width: MediaQuery.of(context).size.width*0.9,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff009689),
            blurRadius: 0,
            offset: Offset(20, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        s,
        style: myTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Body Mass Index",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.9,
              childAspectRatio: 3 / 1,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.028,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.10,
            ),
            children: [
              info("Gender :    $gender", _textStyle),
              info("Height :   $height", _textStyle),
              info("Weight :    $weight", _textStyle),
              info("Age :   $age", _textStyle),
              info("BMI :   ${BMI.toStringAsFixed(1)}", _textStyle),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff009689),
                      blurRadius: 0,
                      offset: Offset(20, 8),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text("Result :    ", style: _textStyle),
                    Text(_result, style: _textStyle.copyWith(fontSize: 24.2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
