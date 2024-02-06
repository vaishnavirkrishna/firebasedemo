import 'package:flutter/material.dart';

class MyCrud extends StatefulWidget {
  const MyCrud({super.key});

  @override
  State<MyCrud> createState() => _MyCrudState();
}

class _MyCrudState extends State<MyCrud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD"),),
      body: ListView.separated(itemBuilder: (context, index) => ListTile(title: Text("NAME"),subtitle: Text("DESIGNATION"),), separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: 10),
    );
  }
}
