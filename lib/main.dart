import 'package:custom_stepper/package/presentation/custom_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 43, 174)),
          // useMaterial3: true,
        ),
        home: CustomStepper(
          steps: [
            AddStep(
                title: 'info',
                content: Container(
                  width: 200,
                  height: 30,
                  color: Colors.black38,
                )),
            AddStep(
                title: 'home',
                content: Container(
                  width: 200,
                  height: 50,
                  color: Colors.black38,
                )),
            AddStep(
                title: 'personal',
                content: Container(
                  width: 200,
                  height: 70,
                  color: Colors.black38,
                )),
            AddStep(
                title: 'address',
                content: Container(
                  width: 200,
                  height: 90,
                  color: Colors.black38,
                )),
          ],
        ));
  }
}
