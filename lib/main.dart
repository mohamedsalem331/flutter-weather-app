import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/location.dart';
import 'pages/loading.dart';
import 'package:flutter_application/services/world_time.dart';

enum Routes { home, location }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const Location(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  WorldTime? worldTime;

  void setupWorldTime(WorldTime worldTimePromise) async {
    // WorldTime worldTimePromise = WorldTime(
    //     location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');

    worldTimePromise
        .getTime()
        .then((_) => {worldTime = worldTimePromise, notifyListeners()});
  }
}
