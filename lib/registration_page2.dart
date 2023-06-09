import 'package:ebarangay_ph/registration_page3.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegStep2 extends StatefulWidget {
  const RegStep2({Key? key}) : super(key: key);

  @override
  State<RegStep2> createState() => _RegStep2State();
}

class _RegStep2State extends State<RegStep2> {

   File? gallimage;
   final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      gallimage = (pickedFile !=null ? File(pickedFile.path) : null)!;
    });
  }

   Future getImageFromCamera() async {
     final pickedFile = await picker.getImage(source: ImageSource.camera);
     setState(() {
       gallimage = (pickedFile !=null ? File(pickedFile.path) : null)!;
     });
   }

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
          children: <Widget>[
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
                  const SizedBox(height: 30.0),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    width: 360,
                    height: 150,
                    child: gallimage == null
                        ? const Text('No image selected.')
                        : Image.file(gallimage!),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.only(left:50),
                    child: ElevatedButton.icon(
                    icon: const Icon(Icons.photo_library),
                    onPressed:  getImageFromGallery,
                    label: const Text('Upload Government ID via Gallery'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey
                      ),
                    ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.only(left: 50),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: getImageFromCamera,
                        label: const Text('Upload Government ID via Camera'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey
                        ),
                      ),
                    ),
                  const SizedBox(height:10),
                  SizedBox(
                    height: 50.0,
                    width: 365,
                    child: Container(
                      padding: const EdgeInsets.only(left:225),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const RegStep3())
                          );
                        },
                        child: const Text('Next'),
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




