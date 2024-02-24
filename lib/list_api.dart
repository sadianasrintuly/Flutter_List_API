import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_model.dart';

class List_get_api extends StatefulWidget {
  const List_get_api({super.key});

  @override
  State<List_get_api> createState() => _List_get_apiState();
}

class _List_get_apiState extends State<List_get_api> {


  Future<List<GetListDataModel>>? fetch_data;

  Future<List<GetListDataModel>> fetchgetdata() async {
    final response = await http.get(Uri.parse("https://flutterapi.brotherdev.com/get_list_api.php"));
     

    if(response.statusCode == 200){

       final parse = json.decode(response.body).cast<Map<String, dynamic>>();

       return parse.map<GetListDataModel>((json) => GetListDataModel.fromJson(json)). toList();

     }else{

       throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchgetdata();
    fetch_data = fetchgetdata();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get List"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<GetListDataModel>>(
            future: fetch_data,
            builder: (context , snapshort){
              if(snapshort.connectionState == ConnectionState.none){
                return CircularProgressIndicator();
              }
              if(snapshort.hasData) {
                return ListView.builder(
                    itemCount: snapshort.data!.length,
                    itemBuilder: (_, index) => Container(
                      child: Column(
                        children: [
                          Text("id: ${snapshort.data![index].id}"),
                          Text("Name: ${snapshort.data![index].name}"),
                          Text("Roll: ${snapshort.data![index].roll}"),
                          Text("Marks:${snapshort.data![index].marks}"),
                        ],
                      ),
                    )
                );
            }
              else{
                return Text("No data Available");
              }
            }
          ),
        ),
      ),
    );
  }
}
