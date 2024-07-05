import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingwithapi/api_model.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<SampleModel> sampleModel = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: sampleModel.length,
                itemBuilder: (context ,index)
                {
                  return Container(
                    height: 180,
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('User_id: ${sampleModel[index].userId}',
                          style: TextStyle(fontSize: 18),),
                        Text('id: ${sampleModel[index].id} ', style: TextStyle(fontSize: 18),),
                        Text('title: ${sampleModel[index].title}',
                          maxLines: 1,
                          style: TextStyle(fontSize: 18),),
                        Text('Body: ${sampleModel[index].body}',
                          maxLines: 1,
                          style: TextStyle(fontSize: 18),),
                      ],),
                  );
                });
          }
          else{
            return Center(child: CircularProgressIndicator(),);

          }


        }
    );
  }

  Future<List<SampleModel>> getData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
    for(Map<String, dynamic> index in data){
    sampleModel.add(SampleModel.fromJson(index));
    }
    return sampleModel;
    } else {
    return sampleModel;
    }

  }


}
