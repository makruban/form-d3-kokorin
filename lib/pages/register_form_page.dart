import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _nameExp = RegExp(r'^[A-za-z ]+$');
  final _phoneExp = RegExp(r'^\(\d\d\d\)\-\d\d\d\-\d\d\-\d\d$');
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                } else if(!_nameExp.hasMatch(value)){
                  return 'Enter only A-z letters';
                } else {
                return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'First name and surname',
                labelText: 'Full Name *',
                prefixIcon: Icon(
                  Icons.person,
                ),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Color(0xFFA92593),
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
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert you phone number';
                } else if(!_phoneExp.hasMatch(value)){
                  return 'Enter format is (000)-000-00-00';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Your telephone number',
                helperText: 'Phone format: (000)-000-00-00',
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Color(0xFFA92593),
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
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insert you email address';
                } else if(!_emailController.text.contains('@')){
                  return 'Format is xxx@xxx.xxx';
                } else {
                  return null;
                }
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
                } else if(_passController.text.length != 8){
                  return 'Password length should be 8';
                } else {
                  return null;
                }
              },
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
              controller: _confirmController,,
              obscureText: _hideConfirm,
                validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Insert your password';
      } else if(_passController.text != _confirmController.text){
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
              onPressed: _printForm,
              style: TextButton.styleFrom(
                  primary: Colors.white, backgroundColor: Colors.green),
              child: Text(
                'Submit Form',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _printForm() {
    if (_formKey.currentState!.validate()) {
      print('form is valid');
      print('Name: ${_nameController.text}');
      print('Name: ${_phoneController.text}');
      print('Name: ${_emailController.text}');
      print('Name: ${_storyController.text}');
    }
  }

}
