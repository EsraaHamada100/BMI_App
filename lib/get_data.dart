import 'package:flutter/material.dart';
import 'package:flutter_app2/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GetDataState();
  }
}

class _GetDataState extends State<GetData> {
  double _value = 10;
  int _weightValue = 40;
  int _ageValue = 10;
  bool _malePressed = true;
  bool _femalePressed = false;
  setData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("gender", _malePressed?"Male":"Female");
    _pref.setInt("age", _ageValue);
    _pref.setInt("weight", _weightValue);
    _pref.setDouble("height", _value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Body Mass Index",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 2),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _malePressed = true;
                                _femalePressed = !_malePressed;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.male,
                                  size: 120,
                                ),
                                Text(
                                  "Male",
                                  style: Theme.of(context).textTheme.button,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                    MediaQuery.of(context).size.width * 0.9 / 2.5,
                                    MediaQuery.of(context).size.height * 0.9 / 3),
                              ),
                              padding:
                              MaterialStateProperty.all(const EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all(
                                  _malePressed
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary),
                              foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _femalePressed = true;
                                _malePressed = !_femalePressed;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.female,
                                  size: 120,
                                ),
                                Text(
                                  "Female",
                                  style: Theme.of(context).textTheme.button,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                    MediaQuery.of(context).size.width * 0.9 / 2.5,
                                    MediaQuery.of(context).size.height * 0.9 / 3),
                              ),
                              padding:
                              MaterialStateProperty.all(const EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all(
                                  _femalePressed
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.secondary),
                              foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.03),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Text(
                            "Height",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            _value.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text("CM",
                              style: Theme.of(context).textTheme.bodyText2),
                          Slider(
                            value: _value,
                            onChanged: (double val) {
                              setState(
                                      () => val >= 10 ? _value = val : _value = 10);
                            },
                            activeColor: Theme.of(context).primaryColor,
                            inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            min: 10,
                            max: 210,
                            divisions: 400,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.03),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Weight",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "$_weightValue",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _weightValue--;
                                        });
                                      },
                                      child: const Icon(Icons.remove),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Theme.of(context).primaryColor),
                                        shape: MaterialStateProperty.all(
                                            const CircleBorder()),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(45, 45)),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _weightValue++;
                                        });
                                      },
                                      child: const Icon(Icons.add),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Theme.of(context).primaryColor),
                                        shape: MaterialStateProperty.all(
                                          const CircleBorder(),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(45, 45)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Age",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "$_ageValue",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _ageValue--;
                                        });
                                      },
                                      child: const Icon(Icons.remove),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Theme.of(context).primaryColor),
                                        shape: MaterialStateProperty.all(
                                            const CircleBorder()),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(45, 45)),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _ageValue++;
                                        });
                                      },
                                      child: const Icon(Icons.add),
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Theme.of(context).primaryColor),
                                        shape: MaterialStateProperty.all(
                                          const CircleBorder(),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(45, 45)),
                                      ),
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
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.03),
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: () {
                        setData();
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                          return Result();
                        }));
                      },
                      child: const Text(
                        "Calculate",
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
