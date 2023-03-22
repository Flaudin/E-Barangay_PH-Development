import 'package:ebarangay_ph/registration_page1.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegStep2 extends StatefulWidget {
  const RegStep2({Key? key}) : super(key: key);

  @override
  State<RegStep2> createState() => _RegStep2State();
}

class _RegStep2State extends State<RegStep2> {

  // late File _image;
  //
  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('android/assets/images/bg.png'),
              fit: BoxFit.cover,
            )
        ),
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 250,
              height: 100,
              child: Image(
                image: AssetImage('android/assets/images/logo.png'),
              ),
            ),
            Container(
              height: 500,
              width: 380,
              margin: const EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 0.5,
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: const Text('Registration',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('STEP: 2',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 225),
                  //   child: _image == null
                  //     ? const Text('No Image Selected')
                  //       :Image.file(_image),
                  // ),
                  const SizedBox(height: 20.0),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () {},
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




