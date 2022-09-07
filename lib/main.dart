import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //const MyAppState({super.key});

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
                InitialState(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InitialState extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text('Pagar'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Payment()),
          );
        },
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de propina'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Gracias!",
                style: TextStyle(
                  fontFamily: 'RobotoMno',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
