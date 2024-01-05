import 'package:flutter/material.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/choose_location': (context) => ChooseLocation(),
      },
    ));


// NOTES
// Stateful Widgets
// initState()
// - Called only once when the widget is created
// -Subscribe to streams or any object that could change our widget data

// Build()
// - Builds the widget tree
// - A build is triggered every time we use setState()

// Dispose()
// - When the widget/ state object is removed


// API Calls and Async Functions
// void getData() async {
  // Sample 1
  // Response response = await get(
  //   Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
  // );
  // Map data = jsonDecode(response.body);
  // print('User ID: ${data['userId']}');
  // print('ID: ${data['id']}');
  // print('Title: ${data['title']}');
  // print('Completed: ${data['completed']}');
  
  // Sample 2
  // Response response = await get(
  //   Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Manila'),
  // );
  // Map data = jsonDecode(response.body);
  // String datetime = data['datetime'];
  // String offset = data['utc_offset'].substring(1, 3);
  // print('------ datetime and offset ------------');
  // print('String Date: ${datetime}');
  // print('String Offset: ${offset}');
  // DateTime now = DateTime.parse(datetime); // create DateTime object
  // int hoursOffset = int.parse(offset);
  // now = now.add(Duration(hours: hoursOffset));// Adjust DateTime object based on the UTC offset
  // print('-------- DateTime now object ----------');
  // print('Final DateTime: ${now}');
// }

// Navigator Routes
// Navigator.pushNamed(context, '/details');
// route identifier (a string) to specify which screen or widget to navigate to.
// user can go back to previous screen

// Navigator.pushReplacementNamed(context, '/newDetails');
// replaces the current route on the navigation stack with the new one.
// user cant navigate back to the previous screen using the back button.
// doesnt add to stack of screens 