import 'package:flutter/material.dart';
import 'package:romannum_flutter/businesses/caculator.dart';
import 'package:romannum_flutter/businesses/roman_number_1.dart';
import 'package:romannum_flutter/businesses/roman_number_2.dart';
import 'package:romannum_flutter/businesses/roman_number_3.dart';
import 'package:romannum_flutter/businesses/roman_number_ex.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String sum = 'sum';
  String sumError = '';

  Calculator? _calculator = Calculator.RomanNumber1;

  ICalculator _roman1calc = RomanNumber1();
  ICalculator _roman2calc = RomanNumber2();
  ICalculator _roman3calc = RomanNumber3();
  ICalculator _romanExcalc = RomanNumberEx();

  ICalculator _calc = RomanNumber1();

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('RomanNumber1'),
                  leading: Radio<Calculator>(
                    value: Calculator.RomanNumber1,
                    groupValue: _calculator,
                    onChanged: setCalculator,
                  ),
                ),
                ListTile(
                  title: const Text('RomanNumber2'),
                  leading: Radio<Calculator>(
                    value: Calculator.RomanNumber2,
                    groupValue: _calculator,
                    onChanged: setCalculator,
                  ),
                ),
                ListTile(
                  title: const Text('RomanNumber3'),
                  leading: Radio<Calculator>(
                    value: Calculator.RomanNumber3,
                    groupValue: _calculator,
                    onChanged: setCalculator,
                  ),
                ),
                ListTile(
                  title: const Text('RomanNumberEx'),
                  leading: Radio<Calculator>(
                    value: Calculator.RomanNumberEx,
                    groupValue: _calculator,
                    onChanged: setCalculator,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Roman number 1',
                  ),
                  validator: num1Validator,
                  controller: num1Controller,
                ),
                SizedBox(
                  height: 16,
                ),
                Text('+'),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Roman number 2',
                  ),
                  validator: num2Validator,
                  controller: num2Controller,
                ),
                SizedBox(
                  height: 16,
                ),
                Text('-------------------------------------'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  sum,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  sumError,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        try {
                          sumError = '';

                          var num1Str = num1Controller.text;
                          var num2Str = num2Controller.text;

                          var num1 = _calc?.str2num(num1Str);
                          var num2 = _calc?.str2num(num2Str);

                          var total = num1! + num2!;

                          sum = _calc?.num2str(total) ?? '';
                        } on String catch (ex) {
                          sumError = ex;
                        }
                      }
                    });
                  },
                  child: const Text('Calculate'),
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String? num1Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    try {
      var num1 = _calc?.str2num(num1Controller.text);
    } on String catch (ex) {
      return ex;
    }
    return null;
  }

  String? num2Validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    try {
      var num2 = _calc?.str2num(num2Controller.text);
    } on String catch (ex) {
      return ex;
    }
    return null;
  }

  void setCalculator(Calculator? calc) {
    setState(() {
      if (calc != null) {
        _calculator = calc;
        _calc = getCalculator(calc);
      }
    });
  }

  ICalculator getCalculator(Calculator calc) {
    switch (calc) {
      case Calculator.RomanNumber1:
        return _roman1calc;
      case Calculator.RomanNumber2:
        return _roman2calc;
      case Calculator.RomanNumber3:
        return _roman3calc;
      case Calculator.RomanNumberEx:
        return _romanExcalc;
    }
  }
}
