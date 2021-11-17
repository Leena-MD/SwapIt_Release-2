import 'package:first_swap/provider/my_provider.dart';

import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:first_swap/src/pages/profile_page.dart';

import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';

import 'package:first_swap/models/goods.dart';
import 'package:provider/provider.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'bags.dart';
import 'books_category.dart';
import 'computer_category.dart';
import 'details_page.dart';

import 'Post_page.dart';
import 'MyItems.dart';
import 'Offers.dart';
import 'gym.dart';
import 'house.dart';
import 'kids_category.dart';

class clothes extends StatefulWidget {
  @override
  _clothes createState() => _clothes();
}

class _clothes extends State<clothes> {
  List<Product> booksList = [];

  ///2nd
  List<Product> computerList = [];
  //3rd
  List<Product> kidsList = [];
  //4th
  List<Product> HouseList = [];

  //5th
  List<Product> BagList = [];

  //6th
  List<Product> perfumeList = [];

  //7th
  List<Product> gymList = [];

  //8th
  List<Product> clothesList = [];
//9th
  List<Product> petList = [];

  List<Product> singleFoodList = [];

  List<Product> burgerCategoriesList = [];
  List<Product> recipeCategoriesList = [];
  List<Product> pizzaCategoriesList = [];
  List<Product> drinkCategoriesList = [];
  List<String> selectedCategory = [];

  String category1 = 'الأجهزة الإلكترونية و ملحقاتها';
  String category2 = ' منتجات الأطفال و الألعاب';
  String category3 = 'المنزل و المطبخ';
  String category4 = 'المستلزمات  المكتبية و الكتب';
  String category5 = 'الاكسسوارات و الحقائب و الأحذية';
  String category6 = '  الجمال و العطور';
  String category7 = ' الرياضة و اللياقة ';
  String category8 = '  الملابس ';
  String category9 = 'مستلزمات الحيوان';

  Widget header() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category1);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ComputerCat()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category1)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'الأجهزة الإلكترونية و ملحقاتها',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category2);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => KidsCat()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category2)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              ' منتجات الأطفال و الألعاب',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category3);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => houseK()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category3)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'المنزل و المطبخ',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category4);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => BooksCat()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category4)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'المستلزمات  المكتبية و الكتب',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category5);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => bags()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category5)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              ' الاكسسوارات و الحقائب و الأحذية',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category6);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => perfume()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category6)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'الجمال و العطور',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category7);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => gym()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category7)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'الرياضة و اللياقة',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category8);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => clothes()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category8)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              ' الملابس',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category9);
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => pet()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: selectedCategory.contains(category9)
                                  ? Colors.cyan[100]
                                  : Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text(
                              'مستلزمات الحيوان',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  ////1st
  Widget burger() {
    return Row(
      children: booksList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.title,
                // onTap: () {
                // Navigator.of(context).pushReplacement(
                // MaterialPageRoute(
                // builder: (context) => Categories(
                //  list: burgerCategoriesList,
                //  ),
                // ),
                // );
                // }
              ))
          .toList(),
    );
  }

////2nd
  Widget recipe() {
    return Row(
      children: computerList
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.title,
                // onTap: () {
                //Navigator.of(context).pushReplacement(
                //MaterialPageRoute(
                //   builder: (context) =>
                //       Categories(list: recipeCategoriesList),
                //  ),
                // );
                // },
              ))
          .toList(),
    );
  }

  //3rd
  Widget pizza() {
    return Row(
      children: kidsList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.title,
              // onTap: () {
              //  Navigator.of(context).pushReplacement(
              //  MaterialPageRoute(
              //   builder: (context) => Categories(list: pizzaCategoriesList),
              //  ),
              //);
              // },
            ),
          )
          .toList(),
    );
  }

  /////4th
  Widget drink() {
    return Row(
      children: HouseList.map(
        (e) => categoriesContainer(
          image: e.image,
          name: e.title,
          // onTap: () {
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //       builder: (context) => Categories(list: drinkCategoriesList),
          //    ),
          // );
          //  },
        ),
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // 1st
    provider.getBookCategory();
    booksList = provider.throwbooksList;
    //2nd
    provider.getComputerCategory();
    computerList = provider.throwComputerList;
    //3rd
    provider.getHouseCategory();
    HouseList = provider.throwHouseList;
    // 4th
    provider.getKidsCategory();
    kidsList = provider.throwKidsList;

    // 5th
    provider.getBagCategory();
    BagList = provider.throwBagList;

    // 6th
    provider.getPerfumeCategory();
    perfumeList = provider.throwPerfumeList;

// 7th
    provider.getGymCategory();
    gymList = provider.throwGymList;

// 8th
    provider.getClothesCategory();
    clothesList = provider.throwClothesList;

    // 9th
    provider.getPetCategory();
    petList = provider.throwPetList;

    //////////////single food list/////////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;
    provider.getrecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavigationBar(
            iconList: [
              Icons.home,
              Icons.add_to_photos,
              Icons.add_a_photo,
              Icons.reorder_rounded,
              Icons.person,
            ],
            onChange: (val) {
              setState(() {
                var _selectedItem = val;
              });
            },
            defaultSelectedIndex: 0,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan[800],
            title:
                Center(child: Text("الملابس", style: TextStyle(fontSize: 20))),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    header(),
                    //  recipe(),
                    //   pizza(),
                    //    drink(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                    children: clothesList
                        .map(
                          (e) => BottomContainer(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    image: e.image,
                                    name: e.title,
                                    description: e.description,
                                  ),
                                ),
                              );
                            },
                            image: e.image,
                            name: e.title,
                          ),
                        )
                        .toList()),
              )
            ],
          )),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);

        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => HomePage()));
          if (_selectedIndex == 1)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => MyItems()));
          if (_selectedIndex == 2)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => PostPage()));

          if (_selectedIndex == 3)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => Offers()));
          if (_selectedIndex == 4)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(this.context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.blueGrey),
                ),
                gradient: LinearGradient(colors: [
                  Colors.blueGrey.withOpacity(0.3),
                  Colors.blueGrey.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)

                //color: index == _selectedItemIndex ? Colors.green : Colors.white,

                )
            : BoxDecoration(),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: index == _selectedIndex ? Colors.black : Colors.grey,
            ),
            if (index == 0) Text('الرئيسية'),
            if (index == 1) Text('منتجاتي'),
            if (index == 2) Text('اضافة'),
            if (index == 3) Text('الطلبات'),
            if (index == 4) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}
