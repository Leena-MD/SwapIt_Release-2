import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../fluttericon.dart';


class Product{

final int id;
final String title;
final IconData iconData;

Product(this.id, this.title, this.iconData);

}
List<Product> productlist = [
Product(1,"الأجهزة الإلكترونية و ملحقاتها",FlutterIcons.computer),
Product(2,"منتجات الأطفال و الألعاب",FlutterIcons.child_friendly),
Product(3,"المنزل و المطبخ",FlutterIcons.home),
Product(4,"المستلزمات المكتبية و الكتب",FlutterIcons.book),
Product(5,"الاكسسوارات و الحقائب و الأحذية",FlutterIcons.bag),
Product(6,"الجمال والعطور",FlutterIcons.brush),
Product(7,"الرياضة و اللياقة",FlutterIcons.fitness_center),
Product(8,"الملابس",FlutterIcons.shirt),
Product(9,"مستلزمات الحيوان",FlutterIcons.pets),
];