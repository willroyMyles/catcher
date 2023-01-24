import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

void main() {
  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [
    ConsoleHandler(),
  ], customParameters: <String, dynamic>{
    "hi": ""
  });
  CatcherOptions releaseOptions = CatcherOptions(PageReportMode(), [
    EmailManualHandler(["recipient@email.com"])
  ], customParameters: <String, dynamic>{
    "hi": ""
  });

  Catcher(
      runAppFunction: () {
        runApp(MyApp());
      },
      debugConfig: debugOptions,
      customParamsFunc: () {
        return {
          "hello": "world",
        };
      },
      releaseConfig: releaseOptions);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ChildWidget()),
    );
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("Generate error"),
        onPressed: () => generateError(),
      ),
    );
  }

  void generateError() async {
    Catcher.sendTestException();
  }
}
