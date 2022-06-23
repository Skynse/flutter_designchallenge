import 'package:designchallenge/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:designchallenge/screens/home_screen.dart';
import 'package:designchallenge/models/models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationsModel()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Challenge #1',
      theme: ThemeData(
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 206, 206, 206), size: 20),
        primarySwatch: // white materialcolor
            const MaterialColor(0xFFF5F5F5, <int, Color>{
          50: Color(0xFFF5F5F5),
          100: Color(0xFFF5F5F5),
          200: Color(0xFFF5F5F5),
          300: Color(0xFFF5F5F5),
          400: Color(0xFFF5F5F5),
          500: Color(0xFFF5F5F5),
          600: Color(0xFFF5F5F5),
          700: Color(0xFFF5F5F5),
          800: Color(0xFFF5F5F5),
          900: Color(0xFFF5F5F5),
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
      },
      initialRoute: '/home',
    );
  }
}
