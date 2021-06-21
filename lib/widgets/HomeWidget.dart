import 'package:buy_sale/widgets/CategoryWidget.dart';
import 'package:buy_sale/widgets/FeaturedAdsWidget.dart';
import 'package:buy_sale/widgets/HomeCarousel.dart';
import 'package:flutter/material.dart';
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: 1000,
              child: HomeCarousel(),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text('Categories'),
            ),
            Container(
              height: 3,
              width: 1000,
              color: Colors.redAccent,
            ),
            Container(
              height:100,
              child: Categories(),
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              child: Text('Featured Ads'),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              height: 2,
              width: 1000,
              color: Colors.greenAccent,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child:FeaturedAds()
            )
          ],
        ),
      ),
    );
  }
}
