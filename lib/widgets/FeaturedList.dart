import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  final int id;
  final String ads_title;
  final String categories;
  final String ads_details;
  final String ads_price;
  final String image_name;
  final String user_id;

  FeaturedList(this.id, this.ads_title, this.categories, this.ads_details,
      this.ads_price, this.image_name, this.user_id);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(image_name),
      footer: GridTileBar(
        title: Text(ads_title),
      ),
    );
  }
}
