import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social/pages/viewuser.dart';
import 'package:social/utils/variables.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<QuerySnapshot> searchuseresult;
  searchuser(String s) {
    var users =
        usercollection.where('username', isGreaterThanOrEqualTo: s).get();

    setState(() {
      searchuseresult = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffECE5DA),
        appBar: AppBar(
          title: TextFormField(
            decoration: InputDecoration(
                filled: true,
                hintText: "Search for users..",
                hintStyle: mystyle(20)),
            onFieldSubmitted: searchuser,
          ),
        ),
        body: searchuseresult == null
            ? Center(
                child: Text(
                  "Search for users....",
                  style: mystyle(20),
                ),
              )
            : FutureBuilder(
                future: searchuseresult,
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot user = snapshot.data.docs[index];
                      return Card(
                        elevation: 8.0,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(user.data()['profilepic']),
                          ),
                          title: Text(
                            user.data()['username'],
                            style: mystyle(20),
                          ),
                          trailing: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViewUser(user.data()['uid']))),
                            child: Container(
                              width: 80,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Center(
                                child: Text("View", style: mystyle(18)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ));
  }
}
