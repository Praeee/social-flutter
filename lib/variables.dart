import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle mystyle(double size, [Color color, FontWeight fw]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

CollectionReference usercollection =
    FirebaseFirestore.instance.collection('users');
String exampleimage =
    'https://cambodiaict.net/wp-content/uploads/2019/12/computer-icons-user-profile-google-account-photos-icon-account.jpg';
CollectionReference tweetcollection =
    FirebaseFirestore.instance.collection('tweets');
    
Reference pictures = FirebaseStorage.instance.ref().child('tweetpics');
