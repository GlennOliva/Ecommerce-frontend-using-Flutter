import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
   
      home: Bmical(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Bmical extends StatefulWidget {
  const Bmical({super.key});

  @override
  State<Bmical> createState() => _BmicalState();
}

class _BmicalState extends State<Bmical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bmi Calculator', style: TextStyle(color: Colors.black) ,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed:  () {},
             icon: Icon(
              Icons.menu,
              color: Colors.black,
             ),
             )
          ],
        ),
      )
    );
  }
}
