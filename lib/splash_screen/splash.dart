import 'package:flutter/material.dart';
import 'package:smart_notifier/user_interface/Onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  choose_screen(context){
    Future.delayed(Duration(seconds: 2),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Intro(),)),);
  }
  @override
  void initState() {
choose_screen(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300, left: 40, right: 20),
                child: Image.asset("assets/images/bell.png", height: 150, width: 150,),
              ),
              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.only(left: 120, right: 115),
                child: LinearProgressIndicator(),
              )
            ],
          ),
        ),



      ),
    );
  }
}

