import 'package:flutter/material.dart';
import 'package:world_time_app/style/colors.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'philippines.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // go to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  // this only runs once u get routed to the page
  @override
  void initState() {
    super.initState();
    print('init state ran');
  }

  // this will run everytime there is a state change
  @override
  Widget build(BuildContext context) {
    print('build fx ran');
    return Scaffold(
      backgroundColor: MyColors.gray,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Choose Location',
          style: TextStyle(
            color: MyColors.white,
          ),
        ),
        backgroundColor: MyColors.black,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}


// Asynch and Await 
// void getData() async {
//     await Future.delayed(Duration(seconds: 3), () {
//       print('first message (delayed)');
//     });

//     Future.delayed(Duration(seconds: 3), () {
//       print('second message (delayed)');
//     });

//     print('last message');
//   }