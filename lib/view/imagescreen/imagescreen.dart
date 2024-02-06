import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyCamera extends StatefulWidget {
  const MyCamera({super.key});

  @override
  State<MyCamera> createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  String imgUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgUrl.isNotEmpty
                ? Container(
                    height: 100,
                    width: 150,
                    color: Colors.blueGrey,
                    child: Image.network(imgUrl),
                  )
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  XFile? pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  print(pickedFile?.path);
                  //reference to the root storage
                  if (pickedFile != null) {
                    final storageRef = FirebaseStorage.instance.ref();
                    //create a folder named image inside storage ref
                    final imageRef = storageRef.child("Image");
                    //reference to the image
                    final uploadRef = imageRef.child(
                        "{DateTime.now().microsecondsSinceEpoch.toString()}"); // timestamp to get unique name for our image
                    await uploadRef.putFile(File(pickedFile.path));
                    //get url
                    var url = await uploadRef.getDownloadURL();
                    //to show image in ui
                    imgUrl = url;
                  }
                },
                child: Text("IMAGE UPLAOD"))
          ],
        ),
      ),
    );
  }
}
