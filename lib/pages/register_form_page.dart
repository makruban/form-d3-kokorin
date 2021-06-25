import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_d2_kokorin/model/user.dart';
import 'package:form_d2_kokorin/pages/user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  bool _hideConfirm = true;
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _storyController = new TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameExp = RegExp(r'^[A-za-z ]+$');
  final _phoneExp = RegExp(r'^\(\d\d\d\)\-\d\d\d\-\d\d\-\d\d$');

  List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'USA', 'England'];
  String _selectedCountry = '';

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = new User();
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert you name';
                } else if (!_nameExp.hasMatch(value)) {
                  return 'Enter only A-z letters';
                } else {
                  return null;
                }
              },
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              decoration: InputDecoration(
                hintText: 'First name and surname',
                labelText: 'Full Name *',
                prefixIcon: Icon(
                  Icons.person,
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    _nameController.clear();
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: Color(0xFFA92593),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              // onSaved: (value) => newUser.name = value,
              onSaved: (value){
                if (value != null) {
                  newUser.name = value;
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert you phone number';
                } else if (!_phoneExp.hasMatch(value)) {
                  return 'Enter format is (000)-000-00-00';
                } else {
                  return null;
                }
              },
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Your telephone number',
                helperText: 'Phone format: (000)-000-00-00',
                prefixIcon: Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: (){
                    _phoneController.clear();
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: Color(0xFFA92593),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onSaved: (value){
                if (value != null){
                  newUser.phone = value;
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            DropdownButtonFormField(
              // validator: (value) {
              //   return (value == null || value == '')
              //       ? 'Select a country'
              //       : null;
              // },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  prefixIcon: Icon(Icons.map),
                  labelText: 'Select country'),
              items: _countries.map((String country) {
                return DropdownMenuItem<String>(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (String? selectCountry) {
                setState(() {
                  _selectedCountry = selectCountry!;
                  newUser.country = selectCountry;
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isNotEmpty) {
                  // return 'Insert you email address';
                if (!_emailController.text.contains('@')) {
                  return 'Format is xxx@xxx.xxx';
                }}
                  return null;

              },
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Your email address',
                prefixIcon: Icon(Icons.mail),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onSaved: (value){
                if (value != null){
                  newUser.email = value;
                }
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: _storyController,
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              decoration: InputDecoration(
                labelText: 'Life Story',
                hintText: 'Tell your story',
                helperText: 'You have three lines',
                prefixIcon: Icon(Icons.assignment_turned_in),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onSaved: (value){
                if (value != null){
                  newUser.story = value;
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert your password';
                } else if (_passController.text.length != 8) {
                  return 'Password length should be 8';
                } else {
                  return null;
                }
              },
              focusNode: _passFocus,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter you password',
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.security),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _confirmController,
              obscureText: _hideConfirm,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert your password';
                } else if (_passController.text != _confirmController.text) {
                  return 'Check yourself';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm',
                prefixIcon: Icon(Icons.border_color),
                suffixIcon: IconButton(
                  icon: Icon(
                      _hideConfirm ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hideConfirm = !_hideConfirm;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _submitForm,
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.green),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(name: _nameController.text);
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Story: ${_storyController.text}');
      print('Country: $_selectedCountry');
    } else {
      _showBottomMessage();
    }
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _showBottomMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text(
          'Form is not valid',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        )));
  }

  void _showDialog({String? name}){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(
          'Registration successful',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        content: Text(
          '$name is now a verified register form',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => UserInfoPage(newUser),
            ),);
          },
          child: Text(
            'Verified', style: TextStyle(
            color: Colors.green,
            fontSize: 18.0,
          ),
          ),),
        ],
      );
    });

  }
}
