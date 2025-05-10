import 'package:flutter/material.dart';
import 'package:ratio_flex/ratio_flex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ratio Flex Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlexFit currentFlexFit = FlexFit.tight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratio Flex Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'RatioRow Example (1:3:1 ratio):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: RatioRow(
                children: [
                  Container(color: Colors.red, width: 100, child: const Center(child: Text('1'))),
                  Container(color: Colors.green, width: 200, child: const Center(child: Text('3'))),
                  Container(color: Colors.blue, width: 100, child: const Center(child: Text('1'))),
                ],
                flexes: [1, 3, 1],
                flexFit: currentFlexFit,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'RatioColumn Example (2:1:3 ratio):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: RatioColumn(
                children: [
                  Container(color: Colors.amber, child: const Center(child: Text('2'))),
                  Container(color: Colors.purple, child: const Center(child: Text('1'))),
                  Container(color: Colors.teal, child: const Center(child: Text('3'))),
                ],
                flexes: [2, 1, 3],
                flexFit: currentFlexFit,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentFlexFit = currentFlexFit == FlexFit.tight ? FlexFit.loose : FlexFit.tight;
          });
        },
        tooltip: 'Toggle Flex Fit (tight/loose)',
        child: Icon(currentFlexFit == FlexFit.tight ? Icons.unfold_less : Icons.unfold_more),
      ),
    );
  }
}
