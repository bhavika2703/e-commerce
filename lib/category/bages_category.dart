import 'package:bhavika_techila_global_services_test/utilities/categ_list.dart';
import 'package:bhavika_techila_global_services_test/widgets/categ_widget.dart';
import 'package:flutter/material.dart';

class BagsCategory extends StatelessWidget {
  const BagsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategHeaderLabel(headerLabel: 'bags'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: List.generate(bags.length, (index) {
                      return SubCategModel(
                        assetName: 'assets/images/bags/bags$index.jpg',
                        mainCategName: 'bags',
                        subCategName: bags[index],
                        subcategLable: bags[index],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
