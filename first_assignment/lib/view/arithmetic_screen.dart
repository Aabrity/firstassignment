import 'package:flutter/material.dart';

class ArithmeticScreen extends StatefulWidget {
  @override
  _ArithmeticScreenState createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  double? _sum;
  double? _difference;
  double? _product;
  double? _quotient;

  void _calculateArithmetic() {
    final num1 = double.tryParse(_num1Controller.text);
    final num2 = double.tryParse(_num2Controller.text);

    if (num1 != null && num2 != null) {
      setState(() {
        _sum = num1 + num2;
        _difference = num1 - num2;
        _product = num1 * num2;
        _quotient = num2 != 0 ? num1 / num2 : double.nan;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Arithmetic')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'First Number'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Second Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArithmetic,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            if (_sum != null) Text('Sum: $_sum'),
            if (_difference != null) Text('Difference: $_difference'),
            if (_product != null) Text('Product: $_product'),
            if (_quotient != null) Text('Quotient: $_quotient'),
          ],
        ),
      ),
    );
  }
}
