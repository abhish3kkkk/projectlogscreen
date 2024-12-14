import 'package:flutter/material.dart';
import 'package:projectlogscreen/firebase_options.dart';
import '../screens/logIn.dart';
import 'package:firebase_core/firebase_core.dart';
import '../modules/firebaseAuth.dart';
import '../modules/googleAuth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Home());
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{

  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passcnfController = TextEditingController();
  TextEditingController userController = TextEditingController();
  bool obsvalue =true;
  bool obsvaluecnf =true;

  final Authentication objAuth = Authentication();

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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  SizedBox(
                    height: 150,
                    child: Text('Hello!!\nRegister to get started',style: TextStyle(fontWeight: FontWeight.bold,fontSize:40)),

                  ),
                  SizedBox(
                    height: 70,
                    width: double.maxFinite,
                    child: TextField(
                      controller: userController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelText: 'username',
                      ),
                    ),
                  ), //username textField
                  SizedBox(
                    height: 70,
                    width: double.maxFinite,
                    child: TextField(
                      controller: mailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelText: 'email',
                      ),
                    ),
                  ), //email TextField
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
                  ), //password TextField
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 60,
                    width: double.maxFinite,
                    child: TextField(
                      controller: passcnfController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        labelText: 'confirm password',
                        suffix: IconButton(
                          icon: Icon(Icons.remove_red_eye,color: Colors.black,size:30),
                          onPressed: (){
                            setState(() {
                              obsvaluecnf = !obsvaluecnf;
                            });
                          },
                        ),
                      ),
                      obscureText: obsvaluecnf,
                    ),
                  ), //password cnf TextField
                  SizedBox(height:20),
                  SizedBox(
                    height: 65,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: (){
                        objAuth.signUp(mailController.text.trim(),passController.text.trim());

                        userController.clear();
                        mailController.clear();
                        passController.clear();
                        passcnfController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Successfully Registered as ${mailController.text}'),
                            duration: Duration(milliseconds: 12,),
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
                      child: Text('Register',style: TextStyle(color: Colors.white,fontSize:20)),
                    ), //Register Button
                  ), //Register ElevatedButton
                  SizedBox(height:10),
                  SizedBox(
                    height: 90,
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
                  SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('already have a account',style: TextStyle(fontSize:17)),
                      TextButton(
                          child: Text('logIn here',style: TextStyle(fontSize:17,fontWeight:FontWeight.bold)),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => LogInHomeScreen()),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}