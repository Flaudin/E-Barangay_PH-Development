import 'package:flutter/material.dart';

class EHeaderDrawer extends StatefulWidget {
  const EHeaderDrawer({super.key});


  @override
  State<EHeaderDrawer> createState() => _EHeaderDrawerState();
}

class _EHeaderDrawerState extends State<EHeaderDrawer> {
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('android/assets/images/logo.png')
              )
            ),
          )
        ],
      ),
    );

  }
}
