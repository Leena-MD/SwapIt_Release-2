import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class MyProvider extends ChangeNotifier {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String uiduser = '';


///////////////////  MyGoods ////////////////
    List<Product> MyGoodsList = [];
late Product MyGoodsData;
  Future<void> getMyGoods() async {

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
 

        
    List<Product> MyGoods = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("owner",isEqualTo: uiduser ,)
        .where("Status",isEqualTo:"available")
        .get();
   
        querySnapshot.docs.forEach((element) {
      
      MyGoodsData = Product(  
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
        IDgoods:element.id,
      );
     MyGoods.add(MyGoodsData);
        MyGoodsList = MyGoods; 
      
    });
    if(querySnapshot.docs.isEmpty){
  MyGoodsList=List.empty();
}

    notifyListeners();
       
  }

 get throwMyGoodsList {    
    return MyGoodsList;
  }
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
 

        
    List<Product> GoodsReceiving = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo:
         "waiting"
    )
        .where("receiverID", isEqualTo:
    uiduser
         )
        .get()) ;
   
        querySnapshot.docs.forEach((element) {
      
      GoodsReceivingData = Product(  
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
        IDgoods:element.id,
      );
     GoodsReceiving.add(GoodsReceivingData);
        GoodsList = GoodsReceiving; 
      
    });

    if(querySnapshot.docs.isEmpty){
  GoodsList=List.empty();
}

    notifyListeners();
       
  }

 get throwGoodsReceivingList {    
    return GoodsList;
  }


///////////////////  waiting ////////////////
    List<Product> waitingList = [];
late Product waitingReceivingData;
  Future<void> getwaiting() async {

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
 

        
    List<Product> waitingReceiving = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo:
         "waiting"
    )
        .where("owner", isEqualTo:
    uiduser
         )
        .get()) ;
   
        querySnapshot.docs.forEach((element) {
      
      waitingReceivingData = Product(  
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
        IDgoods:element.id,
      );
     waitingReceiving.add(waitingReceivingData);
        waitingList = waitingReceiving; 
      
    });

    if(querySnapshot.docs.isEmpty){
  waitingList=List.empty();
}

    notifyListeners();
       
  }

 get throwwaitingReceivingList {    
    return waitingList;
  }



///////////////////  History ////////////////
    List<Product> HistoryList = [];
late Product HistoryListData;
  Future<void> getHistoryList() async {

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
 

        
    List<Product> GoodsHistory = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo:
         "done"
    )
        .where("receiverID", isEqualTo:
    uiduser
         )
        .get()) ;

 
  
        querySnapshot.docs.forEach((element) {

      HistoryListData = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        cate: element.data()['cate'],
        IDgoods:element.id,
      );
     GoodsHistory.add(HistoryListData);
        HistoryList = GoodsHistory;
      
    });
      
      
    notifyListeners();
       
  }

 get throwHistoryList {
    return HistoryList;
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
        .where(
          "Status",
          isEqualTo: 'available',
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
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      computerModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      kidsModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);

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
        .where(
          "Status",
          isEqualTo: 'available',
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
      HouseModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      BagModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      perfumeModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      gymModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      clothesModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
        .where(
          "Status",
          isEqualTo: 'available',
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
      petModle = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods: element.id);
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
          IDgoods: element.id);
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

}