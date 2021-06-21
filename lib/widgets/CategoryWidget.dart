import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Data {
  final int id;
  final String icon;
  final String name;

  Data(this.id, this.icon, this.name);
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<Data>>  myData() async {
    var url=Uri.parse('http://192.168.154.44:8000/api/categories/all');
    var response=await http.get(url);
    List<Data> category=[];
    if(response.statusCode==200){
      List jsonResponse=json.decode(response.body);
      for(var u in jsonResponse){
        Data da=Data(u['id'], u['icon'], u['name']);
        category.add(da);
      }
    }else{
      throw Exception('Error');
    }
    return category;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:myData(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return Container(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
          itemCount: snapshot.data.length, 
          itemBuilder: (BuildContext context,int i){
            return GestureDetector(
              onTap: ()=>{},
              child: GridTile(
                child: Image.network(snapshot.data[i].icon),
                footer: GridTileBar(
                  backgroundColor:Colors.black45,
                  title: Text(snapshot.data[i].name,
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold),),),),
            );
          }),);
        }else{
          return Center(child: Text('Erro'),);
        }
      }
    );
  }
}
