import 'package:flutter/material.dart';

void main(){
  runApp(FirstScreenHome());
}

class FirstScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black12,
          title: Container(
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(29),
              gradient: LinearGradient(
                colors: [Colors.black , Colors.white , Colors.black],
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
              ),
            ),
            child: Row(
              children: [
                BackButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }
                ),
                Text('Kharido.com',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:26))
              ],
            ),
          ),
        ),
        body: Scaffold(

        ),
      ),
    );
  }
}