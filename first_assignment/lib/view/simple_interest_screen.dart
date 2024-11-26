import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  @override
  _SimpleInterestScreenState createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _timeController = TextEditingController();
  double? _result;

  void _calculateInterest() {
    final principal = double.tryParse(_principalController.text);
    final rate = double.tryParse(_rateController.text);
    final time = double.tryParse(_timeController.text);

    if (principal != null && rate != null && time != null) {
      setState(() {
        _result = (principal * rate * time) / 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Interest')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Principal Amount'),
            ),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Rate of Interest (%)'),
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Time (years)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            if (_result != null) Text('Simple Interest: $_result'),
          ],
        ),
      ),
    );
  }
}
