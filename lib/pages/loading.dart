import 'package:flutter/material.dart';
import 'package:world_time_app/style/colors.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:http/http.dart';
import 'dart:convert'; // for converting JSON
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Philippines',
      flag: 'philippines.png',
      url: 'Asia/Manila',
    );
    await instance.getTime();
    print(instance.time);
    setState(
      () {
        time = instance.time;
      },
    );

    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      },
    ); // sends to /home route
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.gray,
      body: Center(
        child: SpinKitThreeBounce(
          color: MyColors.white,
          size: 64.0,
        ),
      ),
    );
  }
}
