import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_1/models/Pizza.dart';
import 'package:flutter_application_1/pages/detail_page/detail_page.dart';

// Define defaultContainer color
const Color defaultContainer = Color(0xFFEDEDED);

class ItemsCard extends StatefulWidget {
  const ItemsCard({super.key});

  @override
  _ItemsCardState createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: listPizza.length,
        itemBuilder: (context, index) => buildCardItem(index),
      ),
    );
  }

  Widget buildCardItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailPage(index: index, pizza: listPizza[index]),
          ),
        );
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 0.5 / 0.55,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 50),
              decoration: BoxDecoration(
                color: defaultContainer,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listPizza[index].title, style: TextStyle(fontSize: 25)),
                  SizedBox(height: 5),
                  Text(listPizza[index].description),
                  SizedBox(height: 15),
                  Text(
                    listPizza[index].prices[0],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page!;
                value = (value * 0.5).clamp(-1, 1);
              }
              return Transform.rotate(
                angle: -pi * value,
                child: Hero(tag: '$index', child: listPizza[index].image),
              );
            },
          ),
        ],
      ),
    );
  }
}
