import 'package:bhavika_techila_global_services_test/category.dart';
import 'package:bhavika_techila_global_services_test/minor_screen/place_order.dart';
import 'package:bhavika_techila_global_services_test/widgets/alert_dialog.dart';
import 'package:bhavika_techila_global_services_test/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  final String? subCategName;
  final String? mainCategName;
  final String? assetName;
  final bool ishomeScreen;

  const CartScreen({
    Key? key,
    this.back,
    this.subCategName,
    this.mainCategName,
    this.assetName,
    this.ishomeScreen = false,
  }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: const AppBarTitle(title: 'Cart'),
            actions: [
              IconButton(
                  onPressed: () {
                    MyAlertDilaog.showMyDialog(
                        context: context,
                        title: 'Clear Cart',
                        content: 'Are you sure to clear cart ?',
                        tabNo: () {
                          Navigator.pop(context);
                        },
                        tabYes: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryScreen()));
                          EmptyCart();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ))
            ],
          ),
          body: widget.ishomeScreen == false
              ? CartItems(
                  assetName: widget.assetName,
                  mainCategName: widget.mainCategName,
                  subCategName: widget.subCategName,
                )
              : const EmptyCart(),
          bottomSheet: widget.ishomeScreen == false
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Total: \$ ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlaceOrderScreen(
                                          assetName: widget.assetName,
                                          subCategName: widget.subCategName,
                                          mainCategName: widget.mainCategName,
                                        )));
                          },
                          child: const Text('CHECK OUT'),
                        ),
                      )
                    ],
                  ),
                )
              : Container(width: 0,height: 0),
        ),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  final String? subCategName;
  final String? mainCategName;
  final String? assetName;

  const CartItems({
    Key? key,
    this.subCategName,
    this.mainCategName,
    this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  height: 300,
                  width: 200,
                  child: Image(
                    image: AssetImage(assetName!),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(subCategName!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10),
                    child:
                        Text(' price: 20 USD', style: TextStyle(fontSize: 17)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 10),
                    child:
                        Text(' discount:10%', style: TextStyle(fontSize: 17)),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 10),
            child: Text('Available offers',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 10),
            child: Text(
                'Buy this product and Get Extra ₹75 Off on Select Room HeatersT&C',
                style: TextStyle(
                  fontSize: 17,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 10),
            child: Text('No Cost EMI with Down Payment',
                style: TextStyle(
                  fontSize: 17,
                )),
          ),
        ],
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your Cart Is Empty !',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 50,
          ),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(25),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.6,
              onPressed: () {
                Navigator.canPop(context)
                    ? Navigator.pop(context)
                    : Navigator.pushReplacementNamed(context, '/customer_home');
              },
              child: const Text(
                'continue shopping',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
