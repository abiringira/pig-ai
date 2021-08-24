import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:PigAi/provider/walkThrough_provider.dart';
import 'package:PigAi/router.dart';
import 'package:PigAi/styles/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WalkThroughProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeScheme.light(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: WalkThroughRoute,
      ),
    );
  }
}
