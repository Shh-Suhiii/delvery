import 'package:flutter/material.dart';
import 'package:flutter_application_1/const.dart';
import 'package:flutter_application_1/pages/detail_page/widgets/my_widget.dart';

class ContainerImagePrice extends StatefulWidget {
  final Image image;
  final int index;
  final MyWidget myWidget;

  const ContainerImagePrice({
    required Key key,
    required this.image,
    required this.index,
    required this.myWidget,
  }) : super(key: key);
  @override
  _ContainerImagePriceState createState() => _ContainerImagePriceState();
}

class _ContainerImagePriceState extends State<ContainerImagePrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            right: -80,
            top: 80,
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: Hero(tag: '${widget.index}', child: widget.image),
            ),
          ),
          Positioned(
            left: 20,
            top: 190,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder:
                      (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                  child: widget.myWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
