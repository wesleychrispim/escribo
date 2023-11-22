import 'package:flutter/material.dart';
import 'Screens/splashscreen.dart';
import 'Screens/Home.dart' as HomeScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen.HomeScreen(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (context) => HomeScreen.HomeScreen());
        }
        return MaterialPageRoute(builder: (context) => Container());
      },
    );
  }
}
