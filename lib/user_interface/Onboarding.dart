import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import 'package:smart_notifier/user_interface/views/file_upload.dart';

import '../ExcelPicker.dart';

class Intro extends StatelessWidget {

  final List<Introduction> list = [
    Introduction(
      title: ' Alert From Application',
      subTitle: 'Upload your Class routine \& get alert from the application',
      imageUrl: 'assets/images/on1.jpg',
    ),
    Introduction(
      title: 'Organize Class Routine',
      subTitle: 'Select Your Course \& download your Routine',
      imageUrl: 'assets/images/on2.jpg',
    ),
    Introduction(
      title: 'Alert For Class Schedule',
      subTitle: 'Select your Course \& set alert manually ',
      imageUrl: 'assets/images/on_3.jpg' ,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      foregroundColor: Colors.blue,
      backgroudColor: Colors.transparent,
      introductionList: list,
      onTapSkipButton: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExcelPickerScreen(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}

