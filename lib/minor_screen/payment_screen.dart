// ignore_for_file: avoid_print

import 'package:bhavika_techila_global_services_test/widgets/appbar_widget.dart';
import 'package:bhavika_techila_global_services_test/widgets/yellow_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 1;
  late String orderId;

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
            title: 'Payment',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '${10} USD',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total order',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            '${10} USD',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Shipping Coast',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            '10.00' + (' USD'),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
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
                    children: [
                      RadioListTile(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        title: const Text('Cash On Delivery'),
                        subtitle: const Text('Pay Cash At Home'),
                      ),
                      RadioListTile(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        title: const Text('Pay via visa / Master Card'),
                        subtitle: Row(
                          children: const [
                            Icon(Icons.payment, color: Colors.blue),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(Icons.payment, color: Colors.blue),
                            ),
                            Icon(Icons.payments_outlined, color: Colors.blue)
                          ],
                        ),
                      ),
                      RadioListTile(
                        value: 3,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        title: const Text('Pay via Paypal'),
                        subtitle: Row(
                          children: const [
                            Icon(
                              Icons.payment,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 15),
                            Icon(
                              Icons.payment,
                              color: Colors.blue,
                            ),
                          ],
                        ),
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
              label: 'Confirm ${10} USD',
              width:MediaQuery.of(context).size.width ,
              onPressed: () {
                if (selectedValue == 1) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 100),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      'Pay At Home ${10} \$',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ]),
                            ),
                          ));
                } else if (selectedValue == 2) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Pay Now ${10} \$ via visa',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ]),
                        ),
                      ));
                } else if (selectedValue == 3) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Pay Now ${10} \$ via Paypal',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ]),
                        ),
                      ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
