import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screencontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final newNameController = TextEditingController();
  CollectionReference employeesCollection =
      FirebaseFirestore.instance.collection('employees');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("add data"),
        ),
        body: StreamBuilder(
          stream: employeesCollection.orderBy("name").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        HomeScreenController().addData(nameController.text);
                      },
                      child: Text("save")),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot employee =
                              snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(border: Border.all()),
                                child: Row(
                                  children: [
                                    Text(employee['name']),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          newNameController.text =
                                              employee["name"];
                                          showBottomSheet(
                                              context: context,
                                              builder: (context) => Container(
                                                    height: 200,
                                                    child: Column(
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              newNameController,
                                                        ),
                                                        SizedBox(
                                                          height: 7,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            HomeScreenController()
                                                                .editData(
                                                              docId:
                                                                  employee.id,
                                                              updatednewName:
                                                                  newNameController
                                                                      .text
                                                                      .trim(),
                                                            );
                                                            newNameController
                                                                .clear();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("save"),
                                                        )
                                                      ],
                                                    ),
                                                  ));
                                        },
                                        child: Icon(Icons.edit)),
                                    InkWell(
                                        onTap: () {
                                          HomeScreenController()
                                              .deleteData(docId: employee.id);
                                        },
                                        child: Icon(Icons.delete))
                                  ],
                                )),
                          );
                        }),
                  ),
                ],
              );
            }
            return Center(
              child: Text("no data found"),
            );
          },
        ));
  }
}
