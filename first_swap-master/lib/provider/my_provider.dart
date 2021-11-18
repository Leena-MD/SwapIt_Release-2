import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';

import 'package:flutter/cupertino.dart';

//import 'package:foodapp/modles/cart_modle.dart';
//import 'package:foodapp/modles/categories_modle.dart';
//import 'package:foodapp/modles/food_categories_modle.dart';
//import 'package:foodapp/modles/food_modle.dart';

class MyProvider extends ChangeNotifier {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String uiduser = '';

///////////////////  category 1 ////////////////
  List<Product> booksList = [];
  late Product booksModle;
  Future<void> getBookCategory() async {
    List<Product> books = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "cate",
          isEqualTo: '3',
        )
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      booksModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        books.add(booksModle);
        booksList = books;
      }
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
        .where("cate", isEqualTo: "0")
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }
    querySnapshot.docs.forEach((element) {
      computerModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newComputerList.add(computerModle);
        computerList = newComputerList;
      }
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
        .where("cate", isEqualTo: '1')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      kidsModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );

      if (element.data()['owner'] != uiduser) {
        newKidsList.add(kidsModle);
        kidsList = newKidsList;
      }
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
        .where("cate", isEqualTo: "2") //2
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      HouseModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newHouseList.add(HouseModle);
        HouseList = newHouseList;
      }
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
        .where("cate", isEqualTo: '4')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      BagModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newBagList.add(BagModle);
        BagList = newBagList;
      }
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
        .where("cate", isEqualTo: '5')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      perfumeModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newPerfumeList.add(perfumeModle);
        perfumeList = newPerfumeList;
      }
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
        .where("cate", isEqualTo: '6')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      gymModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newGymList.add(gymModle);
        gymList = newGymList;
      }
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
        .where("cate", isEqualTo: '7')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      clothesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newClothesList.add(clothesModle);
        clothesList = newClothesList;
      }
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
        .where("cate", isEqualTo: '8')
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    querySnapshot.docs.forEach((element) {
      petModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      if (element.data()['owner'] != uiduser) {
        newPetList.add(petModle);
        petList = newPetList;
      }
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
        /*
        foodModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
        );
        newSingleFoodList.add(foodModle);*/
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
        .where("cate", isEqualTo: "00")
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
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
        .where("cate", isEqualTo: "55")
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
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
        .where("cate", isEqualTo: "66")
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }
}
