import 'package:ebarangay_ph/registration_page2.dart';
import 'package:flutter/material.dart';

const List _genderlist = ['Male', 'Female', 'LGBT'];
const List famClass = ['Nuclear', 'Single Parent', 'Extended', 'Joint', 'Blended'];
const List voterOption = ['Yes', 'No'];
const List regionList = ['Region I - Ilocos Region', 'Region II - Cagayan Valley', 'Region III - Central Luzon', 'Region IV-A', 'MIMAROPA Region', 'Region V - Bicol Region', 'Region VI - Western Visayas', 'Region VII - Central Visayas','Region VIII - Eastern Visayas', 'Region IX - Zamboanga Peninsula', 'Region X - Northern Mindanao', 'Region XI - Davao Region', 'Region XII - SOCCSKSARGEN', 'Region XIII - CARAGA', 'NCR - National Capital Region', 'CAR - Cordillera Administrative Region', 'BARMM - Bangsamoro Autonomus Region'];

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
        if (value!.isEmpty || RegExp(r'^(09|\+639)\d{9}$').hasMatch(value)){
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

class regionLists extends StatefulWidget {
  const regionLists({Key? key}) : super(key: key);

  @override
  State<regionLists> createState() => _regionListsState();
}

class _regionListsState extends State<regionLists> {
  String regionListValue = regionList.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: const InputDecoration(
          labelText: 'Select Region',
          border: OutlineInputBorder(),
        ),
      value: regionListValue,
      onChanged: (value){
          setState(() {
            regionListValue = value!;
          });
      },
      items: regionList.map<DropdownMenuItem>((value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}







