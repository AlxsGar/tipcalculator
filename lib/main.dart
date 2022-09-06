import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double totalCost = 0;
  double preCost = 0;

  void calculateTip(double percentage) {
    setState(() {
      totalCost = preCost + (preCost * percentage);
    });
    print(totalCost);
  }

  TextEditingController orderCost = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de propina'),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.indigo,
                Colors.purple,
              ],
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Bienvenido!",
                  style: TextStyle(
                    fontFamily: 'RobotoMno',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                    child: TextField(
                      controller: orderCost,
                      onEditingComplete: () {
                        setState(() {
                          if (orderCost.text.isNotEmpty) {
                            preCost = double.parse(orderCost.text);
                          } else {
                            preCost = 0;
                          }

                          FocusScope.of(context).unfocus();
                        });
                      },
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Ingresa total de consumo',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.attach_money_rounded),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: const Text(
                    "Selecciona un porcentaje",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => calculateTip(0.05),
                        child: Text(
                          '5%',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () => calculateTip(0.1),
                        child: Text(
                          '10%',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () => calculateTip(0.15),
                        child: Text(
                          '15%',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () => calculateTip(0.20),
                        child: Text(
                          '20%',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Container(
                    child: Text(
                      'Total: $totalCost',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        )),
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
