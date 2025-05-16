import 'package:flutter/material.dart';
import 'package:flutter_application_1/const.dart';
import 'package:flutter_application_1/pages/detail_page/widgets/my_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerChangePrice extends StatefulWidget {
  final String title, description;
  final ValueNotifier<MyWidget> myWidget;
  final List<String> prices;

  const ContainerChangePrice({
    required Key key,
    required this.title,
    required this.description,
    required this.prices,
    required this.myWidget,
  }) : super(key: key);

  @override
  _ContainerChangePriceState createState() => _ContainerChangePriceState();
}

class _ContainerChangePriceState extends State<ContainerChangePrice> {
  int itemSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(widget.description, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    itemSelected = index;
                    widget.myWidget.value = MyWidget(
                      price: widget.prices[index],
                      key: ValueKey(index + 1),
                    );
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  width: 90,
                  decoration: BoxDecoration(
                    color:
                        itemSelected == index ? primaryColor : defaultContainer,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    index == 0
                        ? 'S'
                        : index == 1
                        ? 'M'
                        : 'L',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),

        // ✅ Updated from FlatButton to TextButton
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: SvgPicture.asset(
              'assets/icons/bag.svg',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
