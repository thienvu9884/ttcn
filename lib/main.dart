import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  String dropdownValue = 'Male';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 150, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.account_box),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('Dialog Title',
                                  textAlign: TextAlign.center),
                              content: Container(
                                width: double.infinity,
                                height: 200,
                                child: Column(
                                  children: [
                                    Text(_nameController.text,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.deepOrange)),
                                    Text(_ageController.text,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.deepOrange)),
                                    Text(_addressController.text,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.deepOrange)),
                                    Text(dropdownValue,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.deepOrange))
                                  ],
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                    onPressed: () {
                                      _nameController.clear();
                                      _ageController.clear();
                                      _addressController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Delete"))
                              ],
                            ));
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text(''),
                    //         content: Text(''),
                    //         actions: [
                    //           CupertinoDialogAction(
                    //               child: Text(_nameController.text)),
                    //           CupertinoDialogAction(
                    //               child: Text(_ageController.text)),
                    //           CupertinoDialogAction(
                    //               child: Text(_addressController.text)),
                    //         ],
                    //         // content: Text(_nameController.text),
                    //       );
                    //     });
                  },
                  child: Text("Confirm"))
            ],
          ),
        ),
      ),
    );
  }

// void onConfirm() {
//   setState(() {
//
//   });
// }

// void clearText() {
//   _nameController.clear();
//   _ageController.clear();
//   _addressController.clear();
// }
}
