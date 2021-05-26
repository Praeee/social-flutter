import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:social/addtweet.dart';
import 'package:social/utils/variables.dart';

class TweetsPage extends StatefulWidget {
  @override
  _TweetsPageState createState() => _TweetsPageState();
}

class _TweetsPageState extends State<TweetsPage> {
  String uid;
  initState() {
    super.initState();
    getcurrentuseruid();
  }

  getcurrentuseruid() async {
    var firebaseuser = FirebaseAuth.instance.currentUser;
    setState(() {
      uid = firebaseuser.uid;
    });
  }

  likepost(String documentid) async {
    var firebaseuser = FirebaseAuth.instance.currentUser;
    DocumentSnapshot doc = await tweetcollection.doc(documentid).get();

    if (doc.data()['likes'].contains(firebaseuser.uid)) {
      tweetcollection.doc(documentid).update({
        'likes': FieldValue.arrayRemove([firebaseuser.uid])
      });
    } else {
      tweetcollection.doc(documentid).update({
        'likes': FieldValue.arrayUnion([firebaseuser.uid])
      });
    }
  }

  sharepost(String documentid, String tweet) async {
    Share.text('Flitter', tweet, 'text/plain');
    DocumentSnapshot doc = await tweetcollection.doc(documentid).get();
    tweetcollection
        .doc(documentid)
        .update({'shares': doc.data()['shares'] + 1});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTweet())),
          child: Icon(Icons.add, size: 32),
        ),
        appBar: AppBar(
          actions: [
            Icon(Icons.star, size: 32),
          ],
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flitter',
                style: mystyle(20, Colors.white, FontWeight.w700),
              ),
              SizedBox(
                width: 5.0,
              ),
              Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('images/twitter.png'))
            ],
          ),
        ),
        body: StreamBuilder(
            stream: tweetcollection.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot tweetdoc = snapshot.data.docs[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(tweetdoc['profilepic']),
                        ),
                        title: Text(
                          tweetdoc['username'],
                          style: mystyle(20, Colors.black, FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (tweetdoc['type'] == 1)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tweetdoc['tweet'],
                                  style: mystyle(
                                      20, Colors.black, FontWeight.w400),
                                ),
                              ),
                            if (tweetdoc['type'] == 2)
                              Image(image: NetworkImage(tweetdoc['image'])),
                            if (tweetdoc['type'] == 3)
                              Column(
                                children: [
                                  Text(
                                    tweetdoc.data()['tweet'],
                                    style: mystyle(
                                        20, Colors.black, FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image(
                                      image: NetworkImage(
                                          tweetdoc.data()['image'])),
                                ],
                              ),
                            SizedBox(height: 10),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.comment),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        tweetdoc['commentcount'].toString(),
                                        style: mystyle(18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            likepost(tweetdoc.data()['id']),
                                        child: tweetdoc
                                                .data()['likes']
                                                .contains(uid)
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : Icon(Icons.favorite_border),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        tweetdoc
                                            .data()['likes']
                                            .length
                                            .toString(),
                                        style: mystyle(18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                  children: [
                                    InkWell(
                                      onTap: () => sharepost(
                                          tweetdoc.data()['id'],
                                          tweetdoc.data()['tweet']),
                                      child: Icon(Icons.share),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      tweetdoc.data()['shares'].toString(),
                                      style: mystyle(18),
                                    ),
                                  ],
                                ),
                                ])
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
