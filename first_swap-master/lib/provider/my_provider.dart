import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String uiduser = '';
  String userRate = '';
/////////////////// MyGoods ////////////////
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
    String receiverId = '';
    String goodsSend = '';
    String senderId = '';
    String ownerName = '';

    List<Product> MyGoods = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: uiduser,
        )
        .where("Status", isEqualTo: "available")
        .get();

    querySnapshot.docs.forEach((element) {
      MyGoodsData = Product(
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        ownerRate: element.data()['ownerRate'].toString(),
        ownerName: element.data()['ownerName'].toString(),
        cate: element.data()['cate'],
        IDgoods: element.id,
      );
      MyGoods.add(MyGoodsData);
      MyGoodsList = MyGoods;
    });
    if (querySnapshot.docs.isEmpty) {
      MyGoodsList = List.empty();
    }

    notifyListeners();
  }

  get throwMyGoodsList {
    return MyGoodsList;
  }

/////////////////// Offers ////////////////
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
    String receiverId = '';
    String goodsSend = '';
    String senderId = '';

    List<Product> GoodsReceiving = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo: "waiting")
        .where("receiverID", isEqualTo: uiduser)
        .get());

    querySnapshot.docs.forEach((element) {
      GoodsReceivingData = Product(
        ownerName: element.data()['ownerName'].toString(),
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        ownerRate: element.data()['ownerRate'].toString(),
        cate: element.data()['cate'],
        IDgoods: element.id,
      );
      GoodsReceiving.add(GoodsReceivingData);
      GoodsList = GoodsReceiving;
    });

    if (querySnapshot.docs.isEmpty) {
      GoodsList = List.empty();
    }

    notifyListeners();
  }

  get throwGoodsReceivingList {
    return GoodsList;
  }

/////////////////// waiting ////////////////
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
    String receiverId = '';
    String goodsSend = '';
    String senderId = '';

    List<Product> waitingReceiving = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo: "waiting")
        .where("owner", isEqualTo: uiduser)
        .get());

    querySnapshot.docs.forEach((element) {
      waitingReceivingData = Product(
        ownerName: element.data()['ownerName'].toString(),
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        ownerRate: element.data()['ownerRate'].toString(),
        cate: element.data()['cate'],
        IDgoods: element.id,
      );
      waitingReceiving.add(waitingReceivingData);
      waitingList = waitingReceiving;
    });

    if (querySnapshot.docs.isEmpty) {
      waitingList = List.empty();
    }

    notifyListeners();
  }

  get throwwaitingReceivingList {
    return waitingList;
  }

/////////////////// History ////////////////
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
    String receiverId = '';
    String goodsSend = '';
    String senderId = '';

    List<Product> GoodsHistory = [];
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo: "done")
        .where("receiverID", isEqualTo: uiduser)
        .get());

    querySnapshot.docs.forEach((element) {
      HistoryListData = Product(
        ownerName: element.data()['ownerName'].toString(),
        image: element.data()['image'],
        title: element.data()['gName'],
        description: element.data()['Description'],
        status: element.data()['Status'],
        owner: element.data()['owner'],
        id: element.data()['owner'],
        ownerRate: element.data()['ownerRate'].toString(),
        cate: element.data()['cate'],
        IDgoods: element.id,
      );
      GoodsHistory.add(HistoryListData);
      HistoryList = GoodsHistory;
    });

    if (querySnapshot.docs.isEmpty) {
      HistoryList = List.empty();
    }

    notifyListeners();
  }

  get throwHistoryList {
    return HistoryList;
  }

/////////////////// category 1 ////////////////
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        books.add(booksModle);
        booksList = books;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      booksList = List.empty();
    }
    notifyListeners();
  }

  get throwbooksList {
    return booksList;
  }

  /////////////////// category 2 ////////////////
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newComputerList.add(computerModle);
        computerList = newComputerList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      computerList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);

      if (element.data()['owner'] != uiduser) {
        newKidsList.add(kidsModle);
        kidsList = newKidsList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      kidsList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newHouseList.add(HouseModle);
        HouseList = newHouseList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      HouseList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newBagList.add(BagModle);
        BagList = newBagList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      BagList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newPerfumeList.add(perfumeModle);
        perfumeList = newPerfumeList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      perfumeList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newGymList.add(gymModle);
        gymList = newGymList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      gymList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newClothesList.add(clothesModle);
        clothesList = newClothesList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      clothesList = List.empty();
    }
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        newPetList.add(petModle);
        petList = newPetList;
      }
    });
    if (querySnapshot.docs.isEmpty) {
      petList = List.empty();
    }
    notifyListeners();
  }

  get throwPetList {
    return petList;
  }

/////////////////Goods list /////////////
  List<Product> AllGoodsList = [];
  late Product AllGoodsModle;
  Future<void> getAllGoods() async {
    List<Product> newCAllGoodsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    querySnapshot.docs.forEach((element) {
      AllGoodsModle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);

      newCAllGoodsList.add(AllGoodsModle);
      AllGoodsList = newCAllGoodsList;
    });
    if (querySnapshot.docs.isEmpty) {
      AllGoodsList = List.empty();
    }
    notifyListeners();
  }

  get throwAllGoodsList {
    return AllGoodsList;
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
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
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

  /////////////////// Top1 ////////////////
  List<Product> Top1List = [];
  late Product Top1Modle;
  Future<void> getTop1List() async {
    List<Product> Top1 = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: v0,
        )
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;

    String uiduser = '';
    String userRate = '';
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
      Top1Modle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['owner'] == v0) {
          if (element.data()['cate'] == cat1.substring(0, 1) ||
              element.data()['cate'] == cat2.substring(0, 1) ||
              element.data()['cate'] == cat3.substring(0, 1) ||
              element.data()['cate'] == cat4.substring(0, 1) ||
              element.data()['cate'] == cat5.substring(0, 1) ||
              element.data()['cate'] == cat6.substring(0, 1) ||
              element.data()['cate'] == cat7.substring(0, 1) ||
              element.data()['cate'] == cat8.substring(0, 1)) {
            Top1.add(Top1Modle);
            Top1List = Top1;
          }
        }
      }
    });
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: v1,
        )
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    final firebaseUser1 = await FirebaseAuth.instance.currentUser;

    String uiduser1 = '';
    String userRate1 = '';
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
    querySnapshot1.docs.forEach((element) {
      Top1Modle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['owner'] == v1) {
          if (element.data()['cate'] == cat1.substring(0, 1) ||
              element.data()['cate'] == cat2.substring(0, 1) ||
              element.data()['cate'] == cat3.substring(0, 1) ||
              element.data()['cate'] == cat4.substring(0, 1) ||
              element.data()['cate'] == cat5.substring(0, 1) ||
              element.data()['cate'] == cat6.substring(0, 1) ||
              element.data()['cate'] == cat7.substring(0, 1) ||
              element.data()['cate'] == cat8.substring(0, 1)) {
            Top1.add(Top1Modle);
            Top1List = Top1;
          }
        }
      }
    });
    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: v2,
        )
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    final firebaseUser2 = await FirebaseAuth.instance.currentUser;

    String uiduser2 = '';
    String userRate2 = '';
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
    querySnapshot2.docs.forEach((element) {
      Top1Modle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['owner'] == v2) {
          if (element.data()['cate'] == cat1.substring(0, 1) ||
              element.data()['cate'] == cat2.substring(0, 1) ||
              element.data()['cate'] == cat3.substring(0, 1) ||
              element.data()['cate'] == cat4.substring(0, 1) ||
              element.data()['cate'] == cat5.substring(0, 1) ||
              element.data()['cate'] == cat6.substring(0, 1) ||
              element.data()['cate'] == cat7.substring(0, 1) ||
              element.data()['cate'] == cat8.substring(0, 1)) {
            Top1.add(Top1Modle);
            Top1List = Top1;
          }
        }
      }
    });
    print(Top1.length);
    if (querySnapshot.docs.isEmpty &&
        querySnapshot1.docs.isEmpty &&
        querySnapshot2.docs.isEmpty) {
      Top1List = List.empty();
    }

    notifyListeners();
  }

  get Top1list {
    return Top1List;
  }

/////////////////// Top2 ////////////////
  List<Product> Top2List = [];
  late Product Top2Modle;
  Future<void> getTop2List() async {
    List<Product> Top2 = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: v1,
        )
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    user!.reload();
    String uiduser = '';
    String userRate = '';
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
      Top2Modle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['owner'] == v1) {
          if (element.data()['cate'] == cat1.substring(0, 1) ||
              element.data()['cate'] == cat2.substring(0, 1) ||
              element.data()['cate'] == cat3.substring(0, 1) ||
              element.data()['cate'] == cat4.substring(0, 1) ||
              element.data()['cate'] == cat5.substring(0, 1) ||
              element.data()['cate'] == cat6.substring(0, 1) ||
              element.data()['cate'] == cat7.substring(0, 1) ||
              element.data()['cate'] == cat8.substring(0, 1)) {
            Top2.add(Top2Modle);
            Top2List = Top2;
          }
        }
      }
    });
    if (querySnapshot.docs.isEmpty) {
      Top2List = List.empty();
    }

    notifyListeners();
  }

  get Top2list {
    return Top2List;
  }

/////////////////// Top3 ////////////////
  List<Product> Top3List = [];
  late Product Top3Modle;
  Future<void> getTop3List() async {
    List<Product> Top3 = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: v2,
        )
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();

    final firebaseUser = await FirebaseAuth.instance.currentUser;
    user!.reload();
    String uiduser = '';
    String userRate = '';
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
      Top3Modle = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          ownerRate: element.data()['ownerRate'].toString(),
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['owner'] == v2) {
          if (element.data()['cate'] == cat1.substring(0, 1) ||
              element.data()['cate'] == cat2.substring(0, 1) ||
              element.data()['cate'] == cat3.substring(0, 1) ||
              element.data()['cate'] == cat4.substring(0, 1) ||
              element.data()['cate'] == cat5.substring(0, 1) ||
              element.data()['cate'] == cat6.substring(0, 1) ||
              element.data()['cate'] == cat7.substring(0, 1) ||
              element.data()['cate'] == cat8.substring(0, 1)) {
            Top3.add(Top3Modle);
            Top3List = Top3;
            // print(Top3Modle.description);
          }
        }
      }
    });
    if (querySnapshot.docs.isEmpty) {
      Top3List = List.empty();
    }

    notifyListeners();
  }

  get Top3list {
    return Top3List;
  }

  List<Product> coldlist = [];
  late Product coldModel;
  Future<void> cold() async {
    List<Product> cold = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
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
      coldModel = Product(
          ownerName: element.data()['ownerName'].toString(),
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          ownerRate: element.data()['ownerRate'].toString(),
          cate: element.data()['cate'],
          IDgoods: element.id);
      if (element.data()['owner'] != uiduser) {
        if (element.data()['ownerRate'] == "4.0" ||
            element.data()['ownerRate'] == "5.0" ||
            element.data()['ownerRate'] == "3.0") {
          cold.add(coldModel);
          coldlist = cold;
        }
      }
    });
    notifyListeners();
  }

  get coldlistt {
    return coldlist;
  }
}
