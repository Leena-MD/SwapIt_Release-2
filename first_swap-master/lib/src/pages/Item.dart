import 'package:first_swap/models/product.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final Product product;
  final ValueChanged<bool> onSelected;
  const Item({
    Key? key, required this.product, required this.onSelected,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
 bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return     GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
          widget.onSelected(_isSelected);
        });
      } ,
      child: Container(
       margin: const EdgeInsets.all(16.0), 
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200) ,
            padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: _isSelected ? Border.all(
          width: 1.0,
           color: Colors.blue,
        )
        :null,
        ),
      child: Icon(
        widget.product.iconData,
      size: 32.0,
      
      ),
      
          ),
      SizedBox(height: 12.0),
      Text(
        widget.product.title,
       style: TextStyle(fontWeight:FontWeight.bold ),
       )
      ],
      ),
      
      
      
      ),
    );
  }
}