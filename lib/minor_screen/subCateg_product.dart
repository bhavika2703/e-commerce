import 'package:bhavika_techila_global_services_test/cart.dart';
import 'package:bhavika_techila_global_services_test/widgets/appbar_widget.dart';
import 'package:bhavika_techila_global_services_test/widgets/yellow_button.dart';
import 'package:flutter/material.dart';

class SubCategProducts extends StatefulWidget {
  final String subCategName;
  final String mainCategName;
  final String assetName;

  const SubCategProducts(
      {Key? key,
      required this.subCategName,
      required this.mainCategName,
      required this.assetName})
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
        leading: const AppBarBackButton(),
        title: AppBarTitle(title: widget.subCategName),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage(widget.assetName),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(widget.subCategName, style: const TextStyle(fontSize: 20)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('price: 20 USD', style: TextStyle(fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: YellowButton(
              width: MediaQuery.of(context).size.width * 0.8,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  CartScreen(assetName: widget.assetName,subCategName: widget.subCategName,mainCategName: widget.mainCategName,)));
              },
              label: 'Add to Cart',
            ),
          ),
        ],
      )),
    );
  }
}
