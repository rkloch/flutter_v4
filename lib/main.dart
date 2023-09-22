

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

/// Flutter code sample for [Scaffold].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppExample(),
    );
  }

}




class MyAppExample extends StatefulWidget {
  const MyAppExample({super.key});

  @override
  State<MyAppExample> createState() => _MyAppExampleState();
}

class _MyAppExampleState extends State<MyAppExample>{
  int currentPageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Test"),
      ),
      body: <Widget>[
        Center(
          child: const Text("Home")
        ),

        Center(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Color.fromARGB(100, 0, 100, 140)),

              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => _MyAppSecondPage()));
              }, 
              child: Text("Go To Second Page"))
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,

        onDestinationSelected: (int index) {
          setState((){
            currentPageIndex=index;

        });



        },
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home"),


          NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: "Second Page"),
        ],


      ),
    );

  }
  
}
class _MyAppSecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },


      ),
            ),
      Image(image: AssetImage("assets/secondpage.png")),
          ],
        ),
      ),

    );

  }

}