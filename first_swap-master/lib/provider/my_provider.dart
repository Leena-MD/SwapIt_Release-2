import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/request.dart';
import 'package:first_swap/models/requestModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

//import 'package:foodapp/modles/cart_modle.dart';
//import 'package:foodapp/modles/categories_modle.dart';
//import 'package:foodapp/modles/food_categories_modle.dart';
//import 'package:foodapp/modles/food_modle.dart';

class MyProvider extends ChangeNotifier {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String uiduser = '';


///////////////////  Offers ////////////////
    List<Product> GoodsList = [];
  
late Product GoodsReceivingData;
  Future<void> getGoodsReceiving() async {

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
String receiverId='';
String goodsSend='';
String senderId='';
FirebaseFirestore.instance
        .collection('Requests')
      //  .where("receiverID")
      .doc()
        .get().then((value){
receiverId=value.data()!['receiverID'];
goodsSend=value.data()!['sender goods'];
senderId=value.data()!['sender ID'];

        } ).catchError((e) {
        print(e);
      });

     var value ='';
String idd=FirebaseFirestore.instance.collection('goods').doc().id;
var seee=FirebaseFirestore.instance.collection('Requests');
var docu=await seee.doc('sender ID').get();
if(docu.exists){
    Map<String,dynamic>?data=docu.data();
    value=data?["sender goods"];
}



String rere=FirebaseFirestore.instance.collection('Requests').doc().id;

var collection = FirebaseFirestore.instance.collection('Requests');
var docSnapshot = await collection.doc(rere).get();
print("22222object");

if (docSnapshot.exists) {
  Map<String, dynamic>? data = docSnapshot.data();
print("object");
  // You can then retrieve the value from the Map like this:
  var value = data?['sender goods'];
  print(value);

}



//doc('sender ID')


  //  QuerySnapshot ses = await FirebaseFirestore.instance
  //       .collection('Requests').where('receiverID',

//     List<request> GoodsList1 = [];

// late request GoodsReceivingData1;
// late request goodsSender;

//     List<request> GoodsReceiving1 = [];


//  QuerySnapshot ses = await FirebaseFirestore.instance
//         .collection('Requests')
//         .where("receiverID", isEqualTo: uiduser)
//         //.where('field')
//         .get();


//         ses.docs.forEach((element)  {
// //goodsSender();

//       GoodsReceivingData1 = request(


//         //  receivergoods:element.data()['receiver goods'],
//         // receiverID:element.data()['receiverID'],
//         // senderID:element.data()['sender ID'],  
//          sendergoods:element.data()['sender goods'],
//    //requeststatus:element.data()['request status'],
//    //     GoodsList1.map(element);



// );
//  }

//      );




//     GoodsReceiving1.add(GoodsReceivingData1);
//        GoodsList1 = GoodsReceiving1;

//         print("          GoodsList1=     ");
//        // print(GoodsList1);

     
      
    









 //   db.collection('goods')
      //  .where(db.collection('goods').id,isEqualTo:
        //  (db.collection('Requests').doc('sender goods')))
        //  .snapshots()

var ddddd=(FirebaseFirestore.instance.collection('Requests')
       .doc().id);
      //  then((value)
      //   value.));
print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
       print(ddddd);

    List<Product> GoodsReceiving = [];
    //for loop 
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
    //    .doc(idd)
    //    .collection('Requests')
        .where(idd, isEqualTo: 
       (FirebaseFirestore.instance.collection('Requests')
       .doc(idd)))



//        .where('sender goods', isEqualTo:idd)


//         .where(//ماضبط الشرط
// //          (FirebaseFirestore.instance.collection('goods').doc()),//doc
//           idd,//doc
// //ss فيها ايرور 
//       //    whereIn: 
//       arrayContainsAny:    
//       GoodsList1
// //GoodsList1
// //ses
//         //   (FirebaseFirestore.instance
//         // .collection('Requests')
//         // .where('sender goods')),
//       //  goodsSend
//       //sener id
//   //    senderId
//     //  'BP92cMZe70OKIpnoMqmCFraASx72'
//       //sendergoods
//         )
        // .where((FirebaseFirestore.instance//شاكه فيهم
        // .collection('Requests')
        // .where("receiverID")),isEqualTo: uiduser)
        .get();

 
 if (receiverId == uiduser) {//غيريها بعدين 
      print("جوا الشرط");
              //alert msj


        
      }
  

    else{
        print("55555555555555555555");

        querySnapshot.docs.forEach((element) {
      GoodsReceivingData = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
        IDgoods:element.id
      );
     GoodsReceiving.add(GoodsReceivingData);
        GoodsList = GoodsReceiving;
       print("hiiiiii");
      
    });
        //alert msj
        print("براااااااااا");
      }
    notifyListeners();
       
  }

 get throwGoodsReceivingList {
    return GoodsList;
  }

















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
        IDgoods:element.id
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
        IDgoods:element.id
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
        IDgoods:element.id

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
        IDgoods:element.id

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
        IDgoods:element.id

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
        IDgoods:element.id

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
        IDgoods:element.id
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
        IDgoods:element.id
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
        IDgoods:element.id
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
        IDgoods:element.id
      );
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ////////////////request//////////////

  List<Product> requestList = [];
  late Product requestModle;
  Future<void> getrequest() async {
    List<Product> newrequestList = [];
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
      petModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods:element.id
      );
      if (element.data()['owner'] != uiduser) {
        newrequestList.add(requestModle);
        requestList = newrequestList;
      }
    });
    notifyListeners();
  }

  get throwrequstList {
    return requestList;
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
        IDgoods:element.id
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
        IDgoods:element.id
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }
}
