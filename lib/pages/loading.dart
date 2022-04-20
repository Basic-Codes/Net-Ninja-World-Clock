// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setWorldTime() async {
    // ! Random code to wait for 3 second
    String data = await Future.delayed(Duration(seconds: 3), () {
      print("Waiting for 3 second for no reason...");
      return "Waiting time finished.";
    });

    WorldTime instance =
        WorldTime(location: "Dhaka", flag: "", url: "Asia/Dhaka");
    await instance.getTime();
    print("instance.time = ${instance.time}");
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    setWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        padding: EdgeInsets.all(50),
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
