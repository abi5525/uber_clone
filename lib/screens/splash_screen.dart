import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:uber_clone/extensions/colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:uber_clone/screens/walkthrough_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
      setStatusBarColor(Colors.transparent);
      await 3.seconds.delay;
      finish(context);
      //walkthrough
      WalkthroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:context.height(),
      width: context.width(),
      color: secBackgroundColor,
      child:  GFLoader(
   type:GFLoaderType.ios
 ),
    );
  }
}