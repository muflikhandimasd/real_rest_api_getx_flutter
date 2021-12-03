import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_rest_api_getx_flutter/controller/framework_controller.dart';
import 'package:real_rest_api_getx_flutter/screens/home_screen.dart';

void main() {
  Get.put(FrameworkController());
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FrameworkController controller = FrameworkController.to;

  @override
  void initState() {
    super.initState();
    controller.fetchAllFramework();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFFee5f00)),
      ),
      home: Home(),
    );
  }
}
