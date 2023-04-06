import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:project_tracker/style_values.dart';
import 'package:project_tracker/widgets/card.dart';

import 'widgets/card.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Project Tracker!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _listSpec;

  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _listSpec = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkPurple,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                          value: 'inProgress', child: Text("In Progress")),
                      DropdownMenuItem(
                          value: 'completed', child: Text("Completed")),
                      DropdownMenuItem(
                          value: 'allProjs', child: Text("All Projects"))
                    ],
                    value: _listSpec,
                    onChanged: dropDownCallback,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    dropdownColor: darkPurple,
                  ),
                  OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      iconColor: ButtonColor(1),
                      side: MaterialStateProperty.all(BorderSide(
                          color: lightPink,
                          width: 1.0,
                          style: BorderStyle.solid)),
                    ),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 250, 227, 232),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  children: [
                    const Text("Sort (placeholder)"),
                    Expanded(
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: const [
                          Card(
                              title: '1',
                              description: 'lala',
                              status: "in prog",
                              priority: 5),
                          Card(
                              title: '2',
                              description: 'lal',
                              status: "in prog",
                              priority: 4),
                          Card(
                              title: '3',
                              description: 'la',
                              status: "complete",
                              priority: 3),
                          Card(
                              title: '4',
                              description: 'l',
                              status: "garb",
                              priority: 1),
                          Card(
                              title: '4',
                              description: 'l',
                              status: "garb",
                              priority: 1),
                          Card(
                              title: '4',
                              description: 'l',
                              status: "garb",
                              priority: 1),
                          Card(
                              title: '4',
                              description: 'l',
                              status: "garb",
                              priority: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  final String title;
  final String description;
  final String status;
  final int priority;

  const Card(
      {Key? key,
      required this.title,
      required this.description,
      required this.status,
      required this.priority})
      : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: darkPink,
        height: 100,
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.title),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.orange.withOpacity(.32);
                    }
                    return Colors.orange;
                  }),
                  value: true,
                  onChanged: (bool? value) {
                    ;
                  },
                ),
              ],
            ),
            Text(widget.description),
          ],
        ));
  }
}
