import 'package:flutter/material.dart';
import 'package:form_d2_kokorin/model/user.dart';

class UserInfoPage extends StatelessWidget {

  User userInfo;
  UserInfoPage(this.userInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '${userInfo.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Icon(Icons.check_sharp, color: Colors.green,)
            ),
            ListTile(
              title: Text(
                '${userInfo.phone}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              trailing: Icon(Icons.check_sharp, color: Colors.green,),
            ),
            if(userInfo.country.isNotEmpty) ListTile(
              title: Text(
                '${userInfo.country}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.map_outlined,
                color: Colors.black,
              ),
              trailing: Icon(Icons.check_sharp, color: Colors.green,),
            ),
            if (userInfo.email.isNotEmpty) ListTile(
              title: Text(
                '${userInfo.email}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
              trailing: Icon(Icons.check_sharp, color: Colors.green,),
            ),
            if(userInfo.story.isNotEmpty) ListTile(
              title: Text(
                '${userInfo.story}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Icon(
                Icons.assignment_turned_in,
                color: Colors.black,
              ),
              trailing: Icon(Icons.check_sharp, color: Colors.green,),
            ),
          ],
        ),
      ),
    );
  }

}

// class CheckListTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     if (userInfo.email.isNotEmpty) {
//       return ListTile(
//         title: Text(
//           '${userInfo.email}',
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         leading: Icon(
//           Icons.email,
//           color: Colors.black,
//         ),
//         trailing: Icon(Icons.check_sharp, color: Colors.green,),
//       );
//     }
//   }



