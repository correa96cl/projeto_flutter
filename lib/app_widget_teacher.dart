import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School",
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(child: Text('M ')),
                const Text('Texto 1'),
                const Text("Texto 2"),
                const Text("Texto 3"),
                const Divider(),
                const Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    SizedBox(width: 100),
                    Spacer(),
                    Icon(
                      Icons.access_alarm,
                      color: Colors.yellow,
                    )
                  ],
                ),
                Switch(value: true, onChanged: (val) {}),
                const Card(
                  child: Padding(
                      padding: EdgeInsets.all(16), child: Text('Marcelo')),
                )
              ]),
        ),
      ),
    );
  }
}