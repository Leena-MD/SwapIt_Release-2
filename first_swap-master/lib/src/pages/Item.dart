import 'package:first_swap/models/product.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final Product product;
  final ValueChanged<bool> onSelected;
  const Item({
    Key? key,
    required this.product,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onSelected(_isSelected);
        });
      },
      child: Container(
        height: 50,
        margin:
            const EdgeInsets.only(bottom: 60.0, left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          border: _isSelected
                    ? Border.all(
                        width: 2.0,
                        color: Colors.cyan,
                      )
                    : null,
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,

                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                
              ),
              child: Icon(
                widget.product.iconData,
                size: 30.0,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              widget.product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}