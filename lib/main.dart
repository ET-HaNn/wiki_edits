import 'package:flutter/material.dart';
import 'package:wiki_edits/edit_history.dart';
import 'package:wiki_edits/network_finder.dart';

void main() {
  runApp(const WordCounterApp());
}

class WordCounterApp extends StatelessWidget {
  const WordCounterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: WikiDataFinder(),
      ),
    );
  }
}

class WikiDataFinder extends StatefulWidget {
  const WikiDataFinder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WikiDataWidgetState();
}

class _WikiDataWidgetState extends State<WikiDataFinder> {
  final _controller = TextEditingController();
  final String _message = 'Give a Wiki Page and then click "Get Data"';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(controller: _controller),
      ElevatedButton(onPressed: _onCountPressed, child: const Text('Get Data')),
      Text(_message),
    ]);
  }

  void _onCountPressed() async {
    final location = Uri.parse(_controller.value.text);
    final data = await NetworkReader().read(location);
    final counter = edit_data();
//    final count = counter.countWords(data);
//    setState(() {
//      _message = '';
    });
  }
}
