import 'package:bhavika_techila_global_services_test/minor_screen/payment_screen.dart';
import 'package:bhavika_techila_global_services_test/widgets/appbar_widget.dart';
import 'package:bhavika_techila_global_services_test/widgets/yellow_button.dart';
import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String? subCategName;
  final String? mainCategName;
  final String? assetName;
  const PlaceOrderScreen({Key? key, this.subCategName, this.mainCategName, this.assetName}) : super(key: key);

  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {

  List<String> cart = ['bhavika', '10', '2',];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade200,
          leading: const AppBarBackButton(),
          title: const AppBarTitle(
            title: 'Place Order',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
          child: Column(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Name: ${'bhavika'}'),
                      Text('Phone: ${9182635467}'),
                      Text('Address: abc Aprt, navsari'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(
                       height: 200,
                       width: 300,
                       child: Image(
                         image: AssetImage(widget.assetName!),
                       )),
                   const Padding(
                     padding: EdgeInsets.only(left: 8, top: 10),
                     child:
                     Text(' price: 20 USD', style: TextStyle(fontSize: 17)),
                   ),

                 ],
               ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: YellowButton(
              label: 'Confirm ${20} USD',
              width: MediaQuery.of(context).size.width ,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentScreen()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
