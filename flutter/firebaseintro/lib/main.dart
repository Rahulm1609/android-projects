import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebaseintro/model/board.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Community Board',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
//Firebase authentication

//class _MyHomePageState extends State<MyHomePage> {
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  String _imgUrl;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Auth-Firebade"),
//        centerTitle: true,
//        backgroundColor: Colors.orange,
//      ),
//      backgroundColor: Colors.grey[700],
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: FlatButton(
//                color: Colors.red,
//                child: Text(
//                  "google",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () => _gSignIn(),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: FlatButton(
//                color: Colors.blue,
//                child: Text(
//                  "email",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () => _eMail(),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: FlatButton(
//                color: Colors.green,
//                child: Text(
//                  "create account",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () => _createAcc(),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: FlatButton(
//                color: Colors.redAccent,
//                child: Text(
//                  "logout",
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () => _logout(),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: new Image.network(_imgUrl == null || _imgUrl.isEmpty
//                  ? "https://udemy-images.s3.amazonaws.com/redactor/raw/2019-02-23_01-47-19-0ed5c053df3ef749477b1c217acfb530.PNG"
//                  : _imgUrl),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Future<FirebaseUser> _gSignIn() async {
//    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//        await googleSignInAccount.authentication;
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleSignInAuthentication.accessToken,
//        idToken: googleSignInAuthentication.idToken);
//    FirebaseUser user = await firebaseAuth.signInWithCredential(credential);
//    print("${user.displayName}");
//    setState(() {
//      _imgUrl = user.photoUrl;
//    });
//    return user;
//  }
//
//  _eMail() {
//    firebaseAuth
//        .signInWithEmailAndPassword(
//            email: "rishwanth@gmail.com", password: "rishi12345")
//        .catchError((error) {
//      print("something went wrong: ${error.toString()}");
//    }).then((user) {
//      print("${user.email}");
//    });
//  }
//
//  Future _createAcc() async {
//    FirebaseUser user = await firebaseAuth
//        .createUserWithEmailAndPassword(
//            email: "rishwanth@gmail.com", password: "rishi12345")
//        .then((user) {
//      print("${user.email}");
//    });
//  }
//
//  _logout() {
//    setState(() {
//      googleSignIn.signOut();
//      _imgUrl = null;
//    });
//  }
//}

















//Firebase Database Connectivity APP

class _MyHomePageState extends State<MyHomePage> {
  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();

    board = Board("", "");
    databaseReference = database.reference().child("community_board");
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Board"),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.subject),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => board.subject = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.message),
                      title: TextFormField(
                        initialValue: "",
                        onSaved: (val) => board.body = val,
                        validator: (val) => val == "" ? val : null,
                      ),
                    ),

                    //Send or Post button
                    FlatButton(
                      child: Text("Post"),
                      color: Colors.redAccent,
                      onPressed: () {
                        handleSubmit();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    title: Text(boardMessages[index].subject),
                    subtitle: Text(boardMessages[index].body),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      //save form data to the database
      databaseReference.push().set(board.toJson());
    }
  }

  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }
}
