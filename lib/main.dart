import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 152, 118, 17)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gerador de código'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCode() {
    setState(() {
      _counter = Random().nextInt(1000) + 999;
    });
  }

  Future<void> dialogBuilder() async {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Atenção'),
              content: const Text(
                'Use este código para confirmar seu login',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Entendi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Fechar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 195, 179, 135)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'O seu código é:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () => dialogBuilder(),
                child: const Text(
                  'Mais informacões',
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                //child: showDialog(context: context, builder: builder)
                //Text('dada'),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: _incrementCode,
        tooltip: 'gerar código',
        child: const Icon(Icons.replay_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@override
Widget build(BuildContext context) {
  throw UnimplementedError();
}
