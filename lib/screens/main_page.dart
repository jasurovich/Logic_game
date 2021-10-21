import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _soniController = TextEditingController();
  int inputNumber = 0;
  dynamic factorial = 1;
  var number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Logic Game",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              onChanged: (s) {
                inputNumber = int.parse(_soniController.text);
              },
              keyboardType: TextInputType.number,
              controller: _soniController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  ),
                  hintText: "Enter the desired number...",
                  labelText: "Enter Number",
                  labelStyle: TextStyle(color: Colors.purple)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        number = 0;
                        inputNumber = 0;
                        factorial = 1;
                      });
                    },
                    
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  width: 110.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "$number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  width: 110.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        for (var i = inputNumber; i >= 1; i--) {
                          factorial *= i;
                        }
                        double f = 0.12;
                        number = (factorial * f).toInt();
                      });
                    },
                    
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  width: 110.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .93,
            height: MediaQuery.of(context).size.height * .65,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            child: (number % 2 == 0)
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(
                          5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width * .7,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: number,
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: number,
                  ),
          ),
        ],
      ),
    );
  }
}
