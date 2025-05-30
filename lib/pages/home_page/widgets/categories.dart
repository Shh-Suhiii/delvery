import 'package:flutter/material.dart';
import 'package:flutter_application_1/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> items = ['Popular', 'Pizza', 'Top', 'All menu', 'Food'];
  int itemSelected = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => buildItem(index),
      ),
    );
  }

  Widget buildItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          itemSelected = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              style:
                  (itemSelected == index)
                      ? TextStyle(fontSize: 19, color: Colors.black)
                      : TextStyle(fontSize: 16, color: Colors.grey[500]),
              duration: const Duration(milliseconds: 200),
              child: Text(items[index]),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: (itemSelected == index) ? 20 : 0,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 5.0,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
