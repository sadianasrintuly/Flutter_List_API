import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_model.dart';

class Post_method extends StatefulWidget {
  const Post_method({Key? key}) : super(key: key);

  @override
  State<Post_method> createState() => _Post_methodState();
}
class _Post_methodState extends State<Post_method> {

  late GetListDataModel getModelTest;
  String id = '';
  String name = '';
  String roll = '';
  String marks = '';

  TextEditingController name_controller = TextEditingController();
  TextEditingController roll_controller = TextEditingController();
  TextEditingController marks_controller = TextEditingController();

  //https://flutterapi.brotherdev.com/post_insert_api.php
  submit()async{
    final response = await http.post(Uri.parse("https://flutterapi.brotherdev.com/post_insert_api.php"),
        body: jsonEncode(<String , String>{
          "name" : name_controller.text,
          "roll" : roll_controller.text,
          "marks": marks_controller.text,
        })
    );
    print(response.body);
    print(response.statusCode);
  }
  get_data() async {
    var response =
    await http.get(Uri.parse("https://flutterapi.brotherdev.com/get_api.php"));

    setState(() {
      var getListDataModel = getListDataModelFromJson(response.body);
      // Use different variables for different properties
      id = getModelTest.id;
      roll = getModelTest.roll;
      marks = getModelTest.marks;
      name = getModelTest.name;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call get_data() here
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Post Method',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextFormField(
                controller: name_controller,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                validator: (input){
                  if(input!.isEmpty){
                    return "Input can not be Empty";
                  }
                },
              ),
            ),
            SizedBox(height: 18),
            Center(
              child: TextFormField(
                controller: roll_controller,
                decoration: InputDecoration(
                  hintText: 'Roll',
                ),
                validator: (input){
                  if(input!.isEmpty){
                    return "Input can not be Empty";
                  }
                },
              ),
            ),
            SizedBox(height: 18),
            Center(
              child: TextFormField(
                controller: marks_controller,
                decoration: InputDecoration(
                  hintText: 'Marks',
                ),
                validator: (input){
                  if(input!.isEmpty){
                    return "Input can not be Empty";
                  }
                },
              ),
            ),
            SizedBox(height: 18,),
            TextButton(onPressed: (){ submit();},
              child: Text('Submit',
                style: TextStyle(fontSize: 20, color: Colors.pink),
              ),
            ),

            TextButton(
              onPressed: () {
                get_data();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\n'),
                  Text(id),
                  Text(name),
                  Text(marks),
                  Text(roll),
                  Text('\n'),
                  Text(
                    'Get API',
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
