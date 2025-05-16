import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Pizza.dart';
import 'package:flutter_application_1/pages/detail_page/widgets/container_change_price.dart';
import 'package:flutter_application_1/pages/detail_page/widgets/container_image_price.dart';
import 'package:flutter_application_1/pages/detail_page/widgets/my_widget.dart';

class DetailPage extends StatelessWidget {
  final Pizza pizza;
  final int index;

  const DetailPage({
    Key?
    key, // Changed to nullable key (Key?) as it's optional in newer Flutter versions
    required this.pizza,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<MyWidget> myWidgetNotifier = ValueNotifier<MyWidget>(
      MyWidget(key: const ValueKey(1), price: pizza.prices[0]),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<MyWidget>(
        valueListenable: myWidgetNotifier,
        builder: (context, myWidgetValue, child) {
          return Column(
            children: [
              Flexible(
                flex: 2,
                child: ContainerImagePrice(
                  key: const ValueKey('imagePrice'), // Added key
                  image: pizza.image,
                  index: index,
                  myWidget:
                      myWidgetValue, // Pass the actual MyWidget value
                ),
              ),
              Flexible(
                child: ContainerChangePrice(
                  key: const ValueKey('changePrice'), // Added key
                  title: pizza.title,
                  description: pizza.description,
                  myWidget:
                      myWidgetNotifier, // Pass the ValueNotifier
                  prices: pizza.prices,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
