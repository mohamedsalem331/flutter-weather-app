import 'package:flutter/material.dart';
import 'package:flutter_application/services/world_time.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    var myModel = context.watch<MyAppState>();
    // String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    var worldTime = myModel.worldTime;

    return Scaffold(
      body: worldTime != null
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/day.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: const Icon(Icons.edit_location),
                      label: const Text(
                        "Edit Location",
                        style: TextStyle(letterSpacing: 3, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          worldTime.location,
                          style: const TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      worldTime.time,
                      style:
                          const TextStyle(fontSize: 66.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
