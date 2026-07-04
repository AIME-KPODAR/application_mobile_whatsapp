import 'package:flutter/material.dart';
import 'package:untitled/pages/actus.dart';
import 'package:untitled/pages/appels.dart';
import 'package:untitled/pages/communautes.dart';
import 'package:untitled/pages/discussions.dart';

void main(){
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorSchemeSeed: Colors.green,
      scaffoldBackgroundColor: Colors.white
      ),
      home: HomePage()));

}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState (){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  final pages = [
    DiscussionsPage(),
    ActusPage(),
    CommunautesPage(),
    AppelsPage(),

  ];

  int pageIndex = 0 ;

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:AppBar(
        title: Text("WhatsApp",
          style: TextStyle(color: Colors.green , fontSize: 30),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.camera_alt_outlined),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ]
      ) ,
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
              top:BorderSide(color: Colors.grey, width: 0.8) )
        ),
        child: NavigationBar(
            selectedIndex: pageIndex,
            onDestinationSelected: (int index){
              setState(() {
                pageIndex = index;
              });

            },
            backgroundColor: Colors.white,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.message),
                  label: "Discussions"),
              NavigationDestination(
                  icon: Icon(Icons.filter_tilt_shift),
                  label: "Actus"),
              NavigationDestination(
                  icon: Icon(Icons.groups_outlined),
                  label: "Communautés"),
              NavigationDestination(
                  icon: Icon(Icons.phone_outlined),
                  label: "Appels"),
            ]),
      )
    );
  }
}