import 'package:ebarangay_ph/registration_page1.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'E Barangay Ph Mobile Application',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'E Barangay Ph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('android/assets/images/bg.png'),
        fit: BoxFit.cover,
     ),
     ),
       width: 500,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const SizedBox(
             width: 250,
             height: 100,
             child: Image(
                 image: AssetImage('android/assets/images/logo.png')
             ),
           ),
           Container(
             height: 400,
             width: 380,
             margin: const EdgeInsets.only(top: 15),
             decoration: BoxDecoration(
                 border: Border.all(
                     color: Colors.grey.shade500,
                     width: 0.5
                 )
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   padding: const EdgeInsets.only(top: 20),
                   height: 125,
                   width: 125,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(
                       color: const Color(0xFF0288D1),
                       width: 0.5,
                     ),
                   ),
                 ),
                 const SizedBox(height: 20),
                 const Text(
                   'What Is eBarangayPh?',
                   style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 10),
                 Container(
                   margin: const EdgeInsets.symmetric(horizontal: 18.0),
                   child: const SingleChildScrollView(
                     child:  Text(
                       '“eBarangayPH” is an Online Barangay Information System and an e-governance solution using Internet and Mobile Technologies. It is designed to use systematic approach in managing: Resident Records Blotters Hearing and Settlement Records',
                       style: TextStyle(
                         fontSize: 12,
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 32),
               ],
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Checkbox(value: false, onChanged: (value){}),
               const Text('I agree with the Data Privacy Terms',
               style: TextStyle(
                 fontSize: 10,
               ),
               ),
             ],
           ),
       const SizedBox(height: 0.5),
       SizedBox(
         width: 220,
         child: ElevatedButton(
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => FRegisterpage()),
             );
           },
           child: const Text('GET STARTED'),
         ),
       )
         ],
       ),
     ),
    );
  }



  Widget EHeaderDrawerList()
  {
    return Container();
  }
}
