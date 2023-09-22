import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: afnan(),
    );
  }
}

class afnan extends StatefulWidget {
  const afnan({super.key});

  @override
  State<afnan> createState() => _afnanState();
}

class _afnanState extends State<afnan> {
  TextEditingController con = TextEditingController();
  String operation = '';
  String result = '';
  void _calculate() {
    int number = int.tryParse(con.text) ?? 0;
    setState(() {
      if (operation == 'fact') {
        result = (number * 2).toString();
      } else if (operation == 'multiples') {
        result = List.generate(10, (index) => (number * (index + 1)).toString())
            .join('\n');
      } else if (operation == 'convert') {
        result = (-number).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          TextFiled("enter number1", "number1", con),
          SizedBox(
            height: 18,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'fact';
                        _calculate();
                      });
                    },
                    child: Text("المضروب")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'multiples';
                        _calculate();
                      });
                    },
                    child: Text("المضاعف")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'convert';
                        _calculate();
                      });
                    },
                    child: Text("التحويل")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        con.clear();
                      });
                    },
                    child: Text("تنظيف")),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              width: 100,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  result,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding TextFiled(hint, lbl, con) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: con,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: hint,
            labelText: lbl,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
      ),
    );
  }
}
