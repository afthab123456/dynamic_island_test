import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island_implementation/dynamic_island_manager.dart';
import 'package:flutter_dynamic_island_implementation/dynamic_island_stopwatch_data_model.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StopWatchScreen(),
    );
  }
}

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  String homeScores = '10' ;
  String guestScores = '15' ;
  String homeImageURL = 'https://firebasestorage.googleapis.com/v0/b/r-c-sports.appspot.com/o/schools%2Frc.webp?alt=media&token=9ea1e05b-63c0-4117-b94a-718ecdff70d0'; 
  String guestImageURL = 'https://firebasestorage.googleapis.com/v0/b/r-c-sports.appspot.com/o/schools%2Fstc.webp?alt=media&token=51719359-8266-4cf0-b0e2-06a75c2d04bd';
  String homeImageURL_Small = 'https://firebasestorage.googleapis.com/v0/b/r-c-sports.appspot.com/o/schools%2FRC_Added%20as%20a%20test%20by%20afthab%20ahamed.webp?alt=media&token=138f0d49-cbe9-4a94-9383-2c319b08b2a0';
  String guestImageURL_Small = 'https://firebasestorage.googleapis.com/v0/b/r-c-sports.appspot.com/o/schools%2FSTC_Added%20as%20a%20test%20by%20afthab%20ahamed.webp?alt=media&token=743e6f61-b9d0-40cb-a8b3-8ed224138f44';
  String matchTitle = 'Roy-Tho Waterpolo Encounter';
  String matchSubText = 'Dr. R. L. Hayman Trophy 2nd Leg';
  String leadingURL = 'https://firebasestorage.googleapis.com/v0/b/r-c-sports.appspot.com/o/schools%2FSTC_Added%20as%20a%20test%20by%20afthab%20ahamed.webp?alt=media&token=743e6f61-b9d0-40cb-a8b3-8ed224138f44';
  final DynamicIslandManager diManager = DynamicIslandManager(channelKey: 'DI');

  void startLiveActivity() {    
    diManager.startLiveActivity(
      jsonData: DynamicIslandDataModel(
        homeScores: homeScores,
        guestScores: guestScores,
        homeImageURL: homeImageURL,
        guestImageURL: guestImageURL,
        homeImageURL_Small: homeImageURL_Small,
        guestImageURL_Small: guestImageURL_Small,
        matchTitle: matchTitle,
        matchSubText: matchSubText,
        leadingURL: leadingURL,
      ).toMap(),
    );    
      
    
  }
  void updateLiveActivity() {
    diManager.updateLiveActivity(
        jsonData: DynamicIslandDataModel(
          homeScores: homeScores,
          guestScores: guestScores,
          homeImageURL: homeImageURL,
          guestImageURL: guestImageURL,
          homeImageURL_Small: homeImageURL_Small,
          guestImageURL_Small: guestImageURL_Small,
          matchTitle: matchTitle,
          matchSubText: matchSubText,
          leadingURL: leadingURL,
        ).toMap(),
      );
  }

  void endLiveActivity() {   

    // Invoking the stopLiveActivity Method
    diManager.stopLiveActivity();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: startLiveActivity,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: endLiveActivity,
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
