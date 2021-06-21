import 'dart:async';
import 'dart:convert';
import 'package:buy_sale/widgets/FeaturedList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Data{
  final int id;
  final String ads_title;
  final String categories;
  final String ads_details;
  final String ads_price;
  final List<dynamic> image_name;
  final String user_id;
  Data(this.id,this.ads_title,this.categories,this.ads_details,this.ads_price,this.image_name,this.user_id);
}
class FeaturedAds extends StatefulWidget {
  const FeaturedAds({Key? key}) : super(key: key);

  @override
  _FeaturedAdsState createState() => _FeaturedAdsState();
}

class _FeaturedAdsState extends State<FeaturedAds> {
  Future<List<Data>> myData() async{
      var url=Uri.parse('http://192.168.154.44:8000/api/ads/all');
      var response=await http.get(url);
      var jsonResponse=jsonDecode(response.body);
      List<Data> ads=[];
      for(var u in jsonResponse){
        Data da=Data(u['id'],u['ads_title'],u['categories'],u['ads_details'],u['ads_price'],u['image_name'],u['user_id']);
        ads.add(da);
      }
      return ads;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myData(),
      builder: (BuildContext c,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return Container(
            child: GridView.builder(
              shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemBuilder: (BuildContext c,int i){
                  return Container(
                    child: FeaturedList(
                      snapshot.data[i].id,
                      snapshot.data[i].ads_title,
                      snapshot.data[i].categories,
                      snapshot.data[i].ads_details,
                      snapshot.data[i].ads_price,
                      snapshot.data[i].image_name[0],
                      snapshot.data[i].user_id
                    ),
                  );
                }),
          );
        }else if(snapshot.hasError){
          return Center(child: Text('Error'),);
        }return(Center(child: CircularProgressIndicator(),));
      },
    );
  }
}
