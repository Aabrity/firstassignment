import 'package:flutter/material.dart';

class AreaOfCircleScreen extends StatefulWidget {
  @override
  _AreaOfCircleScreenState createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  final _radiusController = TextEditingController();
  double? _result;

  void _calculateArea() {
    final radius = double.tryParse(_radiusController.text);

    if (radius != null) {
      setState(() {
        _result = 3.14159 * radius * radius;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Area of Circle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Radius'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            if (_result != null) Text('Area of Circle: $_result'),
          ],
        ),
      ),
    );
  }
}
