import 'package:flutter/material.dart';
import 'ffi_bridge.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final FFIBridge _ffiBridge = FFIBridge();

  void _show(message) {
    showDialog(
        builder: (ctx) => AlertDialog(
              content: Text(message.toString()),
              backgroundColor: Colors.lightBlueAccent,
              shape: const StadiumBorder(),
              contentTextStyle: const TextStyle(color: Colors.white),
            ),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: const Text('Get current age'),
                onPressed: () async {
                  _show(_ffiBridge.getAge());
                }),
            ElevatedButton(
                child: const Text('Calculate BMI'),
                onPressed: () async {
                  _show(_ffiBridge.calculateBMI());
                }),
            ElevatedButton(
                child: const Text('Result'),
                onPressed: () async {
                  _show(_ffiBridge.getResult());
                }),
            ElevatedButton(
                child: const Text('Version'),
                onPressed: () async {
                  _show(_ffiBridge.getVersion());
                }),
          ],
        ),
      ),
    );
  }
}
