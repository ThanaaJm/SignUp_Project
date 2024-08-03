// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:app_task1/user.dart';
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

bool isSecured = true;

Map<String, User> users = {
  "alice@gmail.com": User(email: 'alice@gmail.com', password: 'alice00'),
  "thna@gmail.com": User(email: 'thna@gmail.com', password: 'thna77'),
};

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        
        backgroundColor:  Color.fromRGBO(48, 131, 244, 1),
        toolbarHeight: 70,
        centerTitle: true,
        title: Text( 'Login Page',
        style: TextStyle(  fontSize: 40, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           SizedBox(
            height: 25,
          ),
          Image.asset('assets/Firmware-bro.png' , height: 400, width: 400, ),
          Padding( padding: EdgeInsets.symmetric(horizontal:30 ),
          
            child: Column(
              children: [
                
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Enter Email',),
                    prefixIcon: Icon(Icons.person ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide() ),
                      
                  ),
                  ),

                SizedBox( height: 25 ),

                TextFormField(
                  controller: passwordController,
                  obscureText: isSecured,
                  decoration: InputDecoration(
                    label: Text('Enter Password'),
                    prefixIcon: Icon(Icons.lock),

                    suffixIcon: IconButton( onPressed: () {
                      setState(() { isSecured = !isSecured; } );
                      },

                      icon: Icon(Icons.remove_red_eye),
                      ),
                    border: OutlineInputBorder( borderSide: BorderSide(),),
                  ),
                ),

                SizedBox(height: 60),

                InkWell(

                  onTap: () {
                    User user = users[emailController.text]!;
                    if (user.email == emailController.text && user.password == passwordController.text) {
                      print('Logged');
                    } else {
                      print('email or Password is wrong');
                    }
                  },

                  child: Container(
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(48, 131, 244, 1),
                        ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                     Text( 'Login', style: TextStyle(color: Colors.white, fontSize: 20 , fontFamily:WebSocket.userAgent  ), ),

                      SizedBox(width: 5,),

                      Icon( Icons.login, color: Colors.white ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}
