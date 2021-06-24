import 'package:flutter/material.dart';
import 'package:form_d2_kokorin/pages/register_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form d2',
      // theme: ThemeData.light().copyWith(
      //   primaryColor: Colors.red,
      //   hintColor: Colors.grey,
      //   textSelectionHandleColor: Color(0xFFA92593),
      // ),
      home: RegisterFormPage(),
    );
  }
}


