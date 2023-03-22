import 'package:ebarangay_ph/dropdown.dart';
import 'package:flutter/material.dart';

import 'registration_page2.dart';


class FRegisterpage extends StatefulWidget {
  const FRegisterpage({Key? key}) : super(key: key);

  @override
  State<FRegisterpage> createState() => _FRegisterpageState();
}

class _FRegisterpageState extends State<FRegisterpage> {

  bool _legalcheck = false;
  bool _preAddress = false;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _moController = TextEditingController();

  Future _selectDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate){
      setState(() {
        _selectedDate = picked;
        _dateController.text = _selectedDate.toString();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
          decoration: const BoxDecoration(
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
              width: 380,
              margin: const EdgeInsets.only(top: 25),
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
                      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: Text('Registration',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Please provide the details',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                      ),
                    ),
                    const SizedBox(height:20.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('STEP: 1',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
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
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
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
                        title: const Text('Legally without middle name',
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
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child:  genderListDropdown(),
                    ),
                     Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Date of Birth*',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.date_range),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      readOnly: true,
                      controller: _dateController,
                    ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Civil Status',
                      ),
                    ),
                    ),
                     Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: MobileNumberText(
                        controller: _moController,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email Address',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Current Address Information',
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
                          hintText: 'Unit / Lot / Block / House No. *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Street Name *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Subdivision / Village *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Region *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Province *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'City / Municipality *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Barangay *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Sitio / Purok *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Resident Since (YYYY) *',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Permanent Address Information',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Container(
                      child: CheckboxListTile(
                        title: const Text('Same as Current Address',
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                        value: _preAddress,
                        onChanged: (value){
                          setState(() {
                            _preAddress = value!;
                          });
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Unit / Lot / Block / House No. *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Street Name *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Subdivision / Village *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Region *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Province *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'City / Municipality *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Barangay *',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Other Information',
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
                          hintText: 'National ID *',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: FamClassification(),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: VotersOption(),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Precint No.',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Other Information',
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
                          hintText: 'Seniior Citizen ID #',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'SSS Pension / ID',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'GSIS Pensioner / ID',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Person w/ Disability ID #',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Solo Parent ID #',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'OFW (OWWA) ID #',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '4Ps Recipient',
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'SAP Recipient',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 365,
                      child: Container(
                        padding: const EdgeInsets.only(left:225),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => RegStep2())
                            );
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0)
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
