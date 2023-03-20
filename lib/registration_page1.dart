import 'package:flutter/material.dart';

class FRegisterpage extends StatefulWidget {
  const FRegisterpage({Key? key}) : super(key: key);

  @override
  State<FRegisterpage> createState() => _FRegisterpageState();
}

class _FRegisterpageState extends State<FRegisterpage> {

  bool _legalcheck = false;
  String _gender = '';

  List<String> _genderlist = <String>['Male', 'Female', 'LGBT'];

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text('Registration',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Please provide the details',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                      ),
                    ),
                    SizedBox(height:20.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('STEP: 1',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Which city do you live in?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a city',
                      ),
                    ),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Personal Information',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'First Name*',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0.1),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Last Name*',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Middle Name*',
                        ),
                      ),
                    ),
                      Container(
                      child: CheckboxListTile(
                        title: Text('Legally without middle name',
                        style: TextStyle(
                          fontSize: 12,
                        ),),
                        value: _legalcheck,
                        onChanged: (value){
                          setState(() {
                            _legalcheck = value!;
                          });
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Gender by birth*',
                        ),
                      ),
                    ),
                    Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Gender Preferred',
                      ),
                      value: _gender,
                      onChanged: (value){
                        setState(() {
                          _gender = value!;
                        });
                      },
                      items: _genderlist
                      .map((gender) => DropdownMenuItem<String>(
                          value:gender,
                          child: Text(gender),
                      ))
                          .toList(),

                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
