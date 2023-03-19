import 'package:flutter/material.dart';

class FRegisterpage extends StatefulWidget {
  const FRegisterpage({Key? key}) : super(key: key);

  @override
  State<FRegisterpage> createState() => _FRegisterpageState();
}

class _FRegisterpageState extends State<FRegisterpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('android/assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('android/assets/images/logo.png'),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade500,
                      width: 0.5
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Registration',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
