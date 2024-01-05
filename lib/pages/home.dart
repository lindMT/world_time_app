import 'package:flutter/material.dart';
import 'package:world_time_app/style/colors.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print('eto po:');
    print(data);

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.redAccent : Colors.purpleAccent;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/choose_location');
                    if (result != null) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('Change Location'),
                  style: TextButton.styleFrom(
                    foregroundColor: MyColors.gray, // iconColor
                    textStyle: const TextStyle(fontSize: 24.0), // iconSize
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: const TextStyle(
                          fontSize: 32.0,
                          letterSpacing: 2.0,
                          color: MyColors.white,
                        ),
                      )
                    ]),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 64.0,
                    letterSpacing: 2.0,
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
