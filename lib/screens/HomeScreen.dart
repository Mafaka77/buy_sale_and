import 'package:buy_sale/widgets/HomeWidget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy & Sale'),
      ),
      body: HomeWidget(),
    );
  }
}
