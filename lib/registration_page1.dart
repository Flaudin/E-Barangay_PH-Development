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
  final formKey = GlobalKey<FormState>();
  late String cName;

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
              height: 500,
              width: 380,
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade500,
                      width: 0.5
                  )
              ),
              child: Form(
                key: formKey,
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a city',
                        ),
                        validator: (value){
                          if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                            return 'Please enter correct city!';
                          }
                          return null;
                        },
                        onSaved: (value){
                          cName = value!;
                        },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name*',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your first name!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0.1),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last Name*',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your last name!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Middle Name*',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your middle name!';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gender by birth*',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your gender by birth!';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Civil Status',
                        ),
                        validator: (value){
                          if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                            return 'Please enter your civil status!';
                          }
                          return null;
                        },
                      ),
                      ),
                       Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: MobileNumberText(
                          controller: _moController,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email Address',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[\w\.]+@([w-]+\.)+[\w-]{2,5}$').hasMatch(value)){
                              return 'Please enter your civil status!';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Unit / Lot / Block / House No. *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your unit / lot / block / house.no!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Street Name *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your street name!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Subdivision / Village *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your subdivision / village!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: regionLists(),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Province *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter your Province!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'City / Municipality *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter city / municipality';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Barangay *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter barangay';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Sitio / Purok *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter sitio / purok';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Resident Since (YYYY) *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter resident year';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Unit / Lot / Block / House No. *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter unit / lot / block / house no.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Street Name *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter street name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Subdivision / Village *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter subdivision / village';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: regionLists(),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Province *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter province';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'City / Municipality *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter city / municipality';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Barangay *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter barangay';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'National ID *',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter national id';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: FamClassification(),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: VotersOption(),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Precint No.',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter precint no.';
                            }
                            return null;
                          },
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
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Seniior Citizen ID #',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter senior citizen id #!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'SSS Pension / ID',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter sss pension / id.!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'GSIS Pensioner / ID',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter gsis pensioner / id!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Person w/ Disability ID #',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter person w/ disability id #';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Solo Parent ID #',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter solo parent id #';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'OFW (OWWA) ID #',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter ofw (owwa) id #';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '4Ps Recipient',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter 4ps recipient';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'SAP Recipient',
                          ),
                          validator: (value){
                            if (value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Please enter sap recipient';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 365,
                        child: Container(
                          padding: const EdgeInsets.only(left:225),
                          child: ElevatedButton(
                            onPressed: (){
                              if (formKey.currentState !=null && formKey.currentState!.validate()){
                                formKey.currentState?.save();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const RegStep2(),
                                    ),
                                );
                              }
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
              ),
          ],
        ),
      ),
    );
  }
}
