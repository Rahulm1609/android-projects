import 'package:database_crud/model/user.dart';
import 'package:database_crud/util/database_helper.dart';
import 'package:flutter/material.dart';

List _users;

void main() async {
  var db = new DatabaseHelper();
  //Insert user
//  int saveUser = await db.saveUser(new User("kenny", "seb"));
//  print(saveUser);

  //get all users
  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username: ${user.username}, User Id: ${user.id}");
  }

  //get count
  int count = await db.getCount();
  print("Count : $count");

  //delete user
  await db.deleteUser(5);

  //update user
  User rahulUpdated = User.fromMap({"username": "rahulUpdated", "password": "muni", "id": 2});
  await db.updateUser(rahulUpdated);

  runApp(new MaterialApp(
    title: "Database",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (_,int position){
            return new Card(
              child: ListTile(
                title: Text(User.fromMap(_users[position]).username),
                subtitle: Text(User.fromMap(_users[position]).password),
                leading: CircleAvatar(
                  child: Text("${User.fromMap(_users[position]).id}"),

                ),
              ),
            );
          }),
    );
  }
}
