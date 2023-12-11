import 'package:bhavika_techila_global_services_test/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class SubCategProducts extends StatefulWidget {
  final String subCategName;
  final String mainCategName;
  const SubCategProducts(
      {Key? key, required this.subCategName, required this.mainCategName})
      : super(key: key);

  @override
  State<SubCategProducts> createState() => _SubCategProductsState();
}

class _SubCategProductsState extends State<SubCategProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:const AppBarBackButton(),
        title: AppBarTitle(title: widget.subCategName),
      ),
      body: Center(child: Text(widget.mainCategName)),
    );
  }
}
