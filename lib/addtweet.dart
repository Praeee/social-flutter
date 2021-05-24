import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/utils/variables.dart';

class AddTweet extends StatefulWidget {
  @override
  _AddTweetState createState() => _AddTweetState();
}

class _AddTweetState extends State<AddTweet> {
  File imagepath;

  pickImage(ImageSource imgsource) async {
    final image = await ImagePicker().getImage(source: imgsource);
    setState(() {
      imagepath = File(image.path);
    });
    Navigator.pop(context);
  }

  optionsdialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () => pickImage(ImageSource.gallery),
                child: Text(
                  "Image from gallery",
                  style: mystyle(20),
                ),
              ),
              SimpleDialogOption(
                onPressed: () => pickImage(ImageSource.camera),
                child: Text(
                  "Image from camera",
                  style: mystyle(20),
                ),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: mystyle(20),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, size: 32),
        ),
        centerTitle: true,
        title: Text(
          "Add Tweet",
          style: mystyle(20),
        ),
        actions: [
          InkWell(
            onTap: () => optionsdialog(),
            child: Icon(
              Icons.photo,
              size: 40,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              style: mystyle(20),
              decoration: InputDecoration(
                  labelText: "What's happening now",
                  labelStyle: mystyle(25),
                  border: InputBorder.none),
            ),
          ),
          imagepath == null
              ? Container()
              : MediaQuery.of(context).viewInsets.bottom > 0
                  ? Container()
                  : Image(
                      width: 200,
                      height: 200,
                      image: FileImage(imagepath),
                    )
        ],
      ),
    );
  }
}
