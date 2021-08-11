import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var grValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Buttoon"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("the result 4 + 4 = ?"),
            buildAnswer(context, 8, 8, 8),
            buildAnswer(context, 6, 6, 8),
            buildAnswer(context, 4, 4, 8),
          ],
        ),
      ),
    );
  }

  Row buildAnswer(BuildContext context, int vDev, int vuser, int atrue) {
    return Row(
      children: [
        Radio(
            value: vDev,
            groupValue: grValue,
            onChanged: (int? value) {
              setState(() {
                grValue = value!;
                Color c = grValue == atrue ? Colors.green : Colors.red;
                String res = grValue == atrue ? "true" : "false";
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text(
                          "$res",
                          style: TextStyle(color: c),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(
                              height: 5,
                            ),
                            Text("الإجابة الصحيحة هي : ${atrue}")
                          ],
                        ),
                      );
                    });
              });
            }),
        Text(vuser.toString()),
      ],
    );
  }
}
