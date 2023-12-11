import 'package:bhavika_techila_global_services_test/cart.dart';
import 'package:bhavika_techila_global_services_test/category/bages_category.dart';
import 'package:bhavika_techila_global_services_test/category/beauty_category.dart';
import 'package:bhavika_techila_global_services_test/category/electronics_ccategory.dart';
import 'package:bhavika_techila_global_services_test/category/kids_category.dart';
import 'package:bhavika_techila_global_services_test/category/men_category.dart';
import 'package:bhavika_techila_global_services_test/category/shoes_category.dart';
import 'package:bhavika_techila_global_services_test/category/women_category.dart';
import 'package:bhavika_techila_global_services_test/widgets/fake_search.dart';
import 'package:flutter/material.dart';

import 'category/accessories_category.dart';
import 'category/home_and_garden_Category.dart';


List<ItemData> items = [
  ItemData(label: 'men'),
  ItemData(label: 'women'),
  ItemData(label: 'shoes'),
  ItemData(label: 'bags'),
  ItemData(label: 'electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'home & garden'),
  ItemData(label: 'kids'),
  ItemData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const FakeSearch(),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topNavigator(size),
            categView(size)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if(index == 3){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const CartScreen(ishomeScreen: true),
                ));
          }
        },
      ),
    );
  }

  Widget topNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      width: size.width ,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(index,
                  duration: const Duration(
                    milliseconds: 100,
                  ),
                  curve: Curves.bounceInOut);
            },
            child: Container(
                color: items[index].isSelected == true
                    ? Colors.purple.shade200
                    : Colors.grey.shade300,
                width: 140,
                child: Center(child: Text(items[index].label))),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height ,
      width: size.width,
      color: Colors.white,
      child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            for (var element in items) {
              element.isSelected = false;
            }
            setState(() {
              items[value].isSelected = true;
            });
          },
          scrollDirection: Axis.horizontal,
          children: const [
            MenCategory(),
            WomenCategory(),
            ShoesCategory(),
            BagsCategory(),
            ElectronicsCategory(),
            AccessoriesCategory(),
            HomeAndGardenCategory(),
            KidsCategory(),
            BeautyCategory(),
          ]),
    );
  }
}

class ItemData {
  String label;
  bool isSelected;
  ItemData({required this.label, this.isSelected = false});
}
