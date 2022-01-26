import 'package:challenge/others/locator.dart';
import 'package:challenge/providers/albums_provider.dart';
import 'package:challenge/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (_)=> AlbumsProvider(),
          child: HomeScreen()
      ),
    );
  }
}