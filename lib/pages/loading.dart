import 'package:flutter/material.dart';
import 'package:flutter_application/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    WorldTime instance = WorldTime(
        location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
    Provider.of<MyAppState>(context, listen: false).setupWorldTime(instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}


  // void setupWorldTime() async {
  //   WorldTime worldtime = WorldTime(
  //       location: 'Berlin', url: 'germany.png', flag: 'Europe/Berlin');
  //   worldtime.getTime().then((result) => {
  //         Navigator.pushReplacementNamed(context, '/home', arguments: {
  //           'location': worldtime.location,
  //           'flag': worldtime.flag,
  //           'time': worldtime.time,
  //           'isDayTime': worldtime.isDayTime
  //         })
  //       });
  // }
