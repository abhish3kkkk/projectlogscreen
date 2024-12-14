import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../screens/signUp.dart';
import '../modules/firebaseAuth.dart';
import '../modules/googleAuth.dart';
import '../screens/AppScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LogInHome());
}

class LogInHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: LogInHomeScreen(),
    );
  }
}

class LogInHomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LogInHomeScreenState();
  }
}

class LogInHomeScreenState extends State<LogInHomeScreen>{

  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obsvalue =true;

  final Authentication authObj = Authentication();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              BackButton(
                  style: ButtonStyle(
                    iconSize: WidgetStateProperty.all(30),
                    elevation: WidgetStateProperty.all(19),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  onPressed: (){
                    Navigator.pop(
                        context
                    );
                  }
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                SizedBox(
                  height: 200,
                  child: Text('Welcome Back! Glad\nto see you, Again!',style: TextStyle(fontWeight: FontWeight.bold,fontSize:40)),

                ),
                SizedBox(
                  height: 80,
                  width: double.maxFinite,
                  child: TextField(
                    controller: mailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'enter email',
                    ),
                  ),
                ),//email TextField
                SizedBox(
                  height: 60,
                  width: double.maxFinite,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      labelText: 'password',
                      suffix: IconButton(
                        icon: Icon(Icons.remove_red_eye,color: Colors.black,size:30),
                        onPressed: (){
                          setState(() {
                            obsvalue = !obsvalue;
                          });
                        },
                      ),
                    ),
                    obscureText: obsvalue,
                  ),
                ),//password TextField
                Expanded(
                  flex:0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          child: Text('forget password'),
                          onPressed:(){

                          }
                      ),
                    ],
                  ),
                ),//Forget password button
                SizedBox(
                  height: 65,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: (){
                      authObj.logIn(mailController.text.trim(), passController.text.trim());

                      mailController.clear();
                      passController.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You are Successfully loged In as ${mailController.toString()}'),
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FirstScreen()),
                        ),
                      );

                    },
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(20),
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),),
                      shadowColor: WidgetStateProperty.all(Colors.black38),

                      //elevation: WidgetStateProperty.all(9),
                    ),
                    child: Text('LogIn',style: TextStyle(color: Colors.white,fontSize:20)),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child:  Divider(thickness:3,color:Colors.black12),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          height:70,
                          width:90,
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color:Colors.black38,blurStyle:BlurStyle.outer,blurRadius:8)],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Image.asset('assets/images/google.png'),
                        ),
                        onTap:(){

                        },
                      ),
                    ]
                ),
                SizedBox(
                  height: 180,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('dont have a account',style: TextStyle(fontSize:17)),
                      TextButton(
                          child: Text('Register here',style: TextStyle(fontSize:17,fontWeight:FontWeight.bold)),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => HomeScreen()),
                              ),
                            );
                          }
                      ),
                    ],
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