import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/signUp.dart';
import 'screens/logIn.dart';
import 'screens/AppScreen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppHomeState();
  }
}

class MyAppHomeState extends State<MyAppHome>{

  final LogInHomeScreen obj = LogInHomeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex:3,
                child:Center(
                  child: Image.asset('assets/images/plant.png',colorBlendMode: BlendMode.darken,),
                ),
              ),
              Expanded(
                flex:1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => LogInHomeScreen()),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),),
                          elevation: WidgetStateProperty.all(9),
                        ),
                        child: Text('LogIn',style: TextStyle(color: Colors.white,fontSize:20)),
                      ),
                    ),
                    SizedBox(height: 19),
                    SizedBox(
                      height: 65,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => HomeScreen()),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),),
                            side: WidgetStatePropertyAll(BorderSide(color: Colors.black,width: 3)),
                          elevation: WidgetStateProperty.all(9),
                        ),
                        child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.black)),
                      ),
                    ),
                   SizedBox(
                     height: 35,
                   ),
                    TextButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => FirstScreen()),
                            ),
                          );
                        },
                        child: Text('Continue as guest',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20))
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}