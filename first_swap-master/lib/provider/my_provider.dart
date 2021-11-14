import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_swap/models/goods.dart';
import 'package:flutter/cupertino.dart';

//import 'package:foodapp/modles/cart_modle.dart';
//import 'package:foodapp/modles/categories_modle.dart';
//import 'package:foodapp/modles/food_categories_modle.dart';
//import 'package:foodapp/modles/food_modle.dart';

class MyProvider extends ChangeNotifier {
///////////////////  category 1 ////////////////
  List<Product> booksList = [];
  late Product booksModle;
  Future<void> getBookCategory() async {
    List<Product> books = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 3)
        .get();
    querySnapshot.docs.forEach((element) {
      booksModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      books.add(booksModle);
      booksList = books;
    });
    notifyListeners();
  }

  get throwbooksList {
    return booksList;
  }

  ///////////////////  category 2 ////////////////
  List<Product> computerList = [];
  late Product computerModle;
  Future<void> getComputerCategory() async {
    List<Product> newComputerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 0)
        .get();
    querySnapshot.docs.forEach((element) {
      computerModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newComputerList.add(computerModle);
      computerList = newComputerList;
    });
    notifyListeners();
  }

  get throwComputerList {
    return computerList;
  }

  /////////////// Category 3 ///////////////////////
  List<Product> kidsList = [];
  late Product kidsModle;
  Future<void> getKidsCategory() async {
    List<Product> newKidsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 1)
        .get();
    querySnapshot.docs.forEach((element) {
      kidsModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newKidsList.add(kidsModle);
      kidsList = newKidsList;
    });
    notifyListeners();
  }

  get throwKidsList {
    return kidsList;
  }

/////////////////category 4 /////////////
  List<Product> HouseList = [];
  late Product HouseModle;
  Future<void> getHouseCategory() async {
    List<Product> newHouseList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 2) //2
        .get();
    querySnapshot.docs.forEach((element) {
      HouseModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newHouseList.add(HouseModle);
      HouseList = newHouseList;
    });
    notifyListeners();
  }

  get throwHouseList {
    return HouseList;
  }

/////////////////category 5 /////////////
  List<Product> BagList = [];
  late Product BagModle;
  Future<void> getBagCategory() async {
    List<Product> newBagList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 4)
        .get();
    querySnapshot.docs.forEach((element) {
      BagModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newBagList.add(BagModle);
      BagList = newBagList;
    });
    notifyListeners();
  }

  get throwBagList {
    return BagList;
  }

  /////////////////category 6 /////////////
  List<Product> perfumeList = [];
  late Product perfumeModle;
  Future<void> getPerfumeCategory() async {
    List<Product> newPerfumeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 5)
        .get();
    querySnapshot.docs.forEach((element) {
      perfumeModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newPerfumeList.add(perfumeModle);
      perfumeList = newPerfumeList;
    });
    notifyListeners();
  }

  get throwPerfumeList {
    return perfumeList;
  }

/////////////////category 7 /////////////
  List<Product> gymList = [];
  late Product gymModle;
  Future<void> getGymCategory() async {
    List<Product> newGymList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 6)
        .get();
    querySnapshot.docs.forEach((element) {
      gymModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newGymList.add(gymModle);
      gymList = newGymList;
    });
    notifyListeners();
  }

  get throwGymList {
    return gymList;
  }

  /////////////////category 8 /////////////
  List<Product> clothesList = [];
  late Product clothesModle;
  Future<void> getClothesCategory() async {
    List<Product> newClothesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 7)
        .get();
    querySnapshot.docs.forEach((element) {
      clothesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newClothesList.add(clothesModle);
      clothesList = newClothesList;
    });
    notifyListeners();
  }

  get throwClothesList {
    return clothesList;
  }

/////////////////category 9 /////////////
  List<Product> petList = [];
  late Product petModle;
  Future<void> getPetCategory() async {
    List<Product> newPetList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: 8)
        .get();
    querySnapshot.docs.forEach((element) {
      petModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newPetList.add(petModle);
      petList = newPetList;
    });
    notifyListeners();
  }

  get throwPetList {
    return petList;
  }

  /////////////////////  Single Food Item     //////////////////////////
  List<Product> foodModleList = [];
  late Product foodModle;
  Future<void> getFoodList() async {
    List<Product> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('goods').get();
    querySnapshot.docs.forEach(
      (element) {
        foodModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
        );
        newSingleFoodList.add(foodModle);
      },
    );

    foodModleList = newSingleFoodList;
    notifyListeners();
  }

  get throwFoodModleList {
    return foodModleList;
  }

  ///////////////burger categories list//////////
  List<Product> burgerCategoriesList = [];
  late Product burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<Product> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: "0")
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ///////////////Recipe categories list//////////
  List<Product> recipeCategoriesList = [];
  late Product recipeCategoriesModle;
  Future<void> getrecipeCategoriesList() async {
    List<Product> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: "5")
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newrecipeCategoriesList.add(recipeCategoriesModle);
      recipeCategoriesList = newrecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  ///////////////Pizza categories list//////////
  List<Product> pizzaCategoriesList = [];
  late Product pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<Product> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("Category", isEqualTo: "6")
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }
}
