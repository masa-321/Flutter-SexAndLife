import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'services/data_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataState>(
      create: (context) => DataState(),
      child: MaterialApp(
        title: "Sex & Life",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

