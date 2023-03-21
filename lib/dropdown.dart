import 'package:ebarangay_ph/registration_page2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const List _genderlist = ['Male', 'Female', 'LGBT'];
const List famClass = ['Nuclear', 'Single Parent', 'Extended', 'Joint', 'Blended'];
const List voterOption = ['Yes', 'No'];

class genderListDropdown extends StatefulWidget {
  const genderListDropdown({Key? key}) : super(key: key);

  @override
  State<genderListDropdown> createState() => _genderListDropdownState();
}

class _genderListDropdownState extends State<genderListDropdown> {
  String dropdownValue = _genderlist.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Preferred Gender',
      ),
      value: dropdownValue,
      onChanged: (value){
        setState(() {
          dropdownValue = value!;
        });
      },
      items: _genderlist.map<DropdownMenuItem>((value){
        return DropdownMenuItem(
            value: value,
            child: Text(value)
        );
      }).toList(),
      );
  }
}

class MobileNumberText extends StatelessWidget {
  final TextEditingController controller;
  const MobileNumberText({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        prefixText: '+63',
        labelText: 'Mobile Number',
        border: OutlineInputBorder(),
      ),
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Mobile number is required';
        }
        return null;
      },
    );
  }
}

class FamClassification extends StatefulWidget {
  const FamClassification({Key? key}) : super(key: key);

  @override
  State<FamClassification> createState() => _FamClassificationState();
}

class _FamClassificationState extends State<FamClassification> {
  String famClassValue = famClass.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
        value: famClassValue,
        onChanged: (value){
        setState(() {
          famClassValue = value!;
        });
        },
        items: famClass.map<DropdownMenuItem>((value){
          return DropdownMenuItem(
          value: value,
          child: Text(value),
          );
    }).toList(),
    );
  }
}

class VotersOption extends StatefulWidget {
  const VotersOption({Key? key}) : super(key: key);

  @override
  State<VotersOption> createState() => _VotersOptionState();
}

class _VotersOptionState extends State<VotersOption> {
  String voteOptionValue = voterOption.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: 'Is Local Voter (Y / N)?',
        border: OutlineInputBorder(),
      ),
      value: voteOptionValue,
      onChanged: (value){
        setState(() {
          voteOptionValue = value!;
        });
      },
      items: voterOption.map<DropdownMenuItem>((value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class RegNextBtn extends StatefulWidget {
  const RegNextBtn({Key? key}) : super(key: key);

  @override
  State<RegNextBtn> createState() => _RegNextBtnState();
}

class _RegNextBtnState extends State<RegNextBtn> {
  final _formKey = GlobalKey<FormState>();
  
  void _regNext1(){
    if (_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegStep2()),
      );
    }
    else{
      showDialog(
        context: context,
        builder: (context) =>  AlertDialog(
          title:  const Text('Error'),
          content: const Text('Please fill in all fields.'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
            )
          ],
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _regNext1,
        child: const Text('Next'),
    );
  }
}



