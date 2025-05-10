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
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const OriginalExamplesPage(),
    const RatioFlexExamplesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratio Flex Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Row & Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt),
            label: 'RatioFlex',
          ),
        ],
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

class OriginalExamplesPage extends StatelessWidget {
  const OriginalExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexFit = context.findAncestorStateOfType<_MyHomePageState>()?.currentFlexFit ?? FlexFit.tight;

    return Center(
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
              flexFit: flexFit,
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
              flexFit: flexFit,
            ),
          ),
        ],
      ),
    );
  }
}

class RatioFlexExamplesPage extends StatelessWidget {
  const RatioFlexExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexFit = context.findAncestorStateOfType<_MyHomePageState>()?.currentFlexFit ?? FlexFit.tight;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RatioFlex with Axis.horizontal (1:2:1):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: RatioFlex(
              direction: Axis.horizontal,
              children: [
                Container(color: Colors.red, child: const Center(child: Text('1'))),
                Container(color: Colors.green, child: const Center(child: Text('2'))),
                Container(color: Colors.blue, child: const Center(child: Text('1'))),
              ],
              flexes: [1, 2, 1],
              flexFit: flexFit,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'RatioFlex with Axis.vertical (3:1:2):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: RatioFlex(
              direction: Axis.vertical,
              children: [
                Container(color: Colors.amber, child: const Center(child: Text('3'))),
                Container(color: Colors.purple, child: const Center(child: Text('1'))),
                Container(color: Colors.teal, child: const Center(child: Text('2'))),
              ],
              flexes: [3, 1, 2],
              flexFit: flexFit,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'RatioFlex with default flex values (all equal):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: RatioFlex(
              direction: Axis.horizontal,
              children: [
                Container(color: Colors.pink, child: const Center(child: Text('Equal'))),
                Container(color: Colors.cyan, child: const Center(child: Text('Equal'))),
                Container(color: Colors.amber, child: const Center(child: Text('Equal'))),
              ],
              // No flexes provided - all have flex: 1
              flexFit: flexFit,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'RatioFlex with different alignment:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: RatioFlex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(color: Colors.orange, width: 80, height: 50, child: const Center(child: Text('1'))),
                Container(color: Colors.indigo, width: 80, height: 50, child: const Center(child: Text('1'))),
                Container(color: Colors.lime, width: 80, height: 50, child: const Center(child: Text('1'))),
              ],
              flexFit: FlexFit.loose, // Using loose to demonstrate spacing
            ),
          ),
        ],
      ),
    );
  }
}
