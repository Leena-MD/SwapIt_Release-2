import 'package:cloud_firestore/cloud_firestore.dart';

class goodsModel {
  String? uid;
  String? name;
  String? desc;
  String? img;
  String? stat;
  int? gnum;
  String? own;
  String? cate;
  String? IDgoods;
  double? PRate;
  String? ownerRate;
  String? ownerName;
  String? caseSearch;
  goodsModel(
      {this.uid,
      this.name,
      this.desc,
      this.img,
      this.gnum,
      this.stat,
      this.own,
      this.cate,
      this.IDgoods,
      this.PRate,
      this.ownerRate,
      this.ownerName,
      this.caseSearch});

  // receiving data from server
  factory goodsModel.fromMap(map) {
    return goodsModel(
        uid: map['uid'],
        name: map['gName'],
        desc: map['Description'],
        img: map['image'],
        gnum: map['numGood'],
        stat: map['Status'],
        own: map['owner'],
        cate: map['cate'],
        PRate: map['rate'],
        ownerRate: map['ownerRate'],
        ownerName: map['ownerName'],
        caseSearch: map['caseSearch']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'gName': name,
      'Description': desc,
      'image': img,
      'numGood': gnum,
      'Status': stat,
      'owner': own,
      'cate': cate,
      'rate': PRate,
      'ownerRate': ownerRate,
      'ownerName': ownerName,
      'caseNumber':caseSearch
    };
  }

  goodsModel.fromSnapshot(DocumentSnapshot snapshot) :
        uid = snapshot['uid'],
        name = snapshot['gName'],
        desc = snapshot['Description'],
        img = snapshot['image'],
        gnum = snapshot['numGood'],
        stat = snapshot['Status'],
        own = snapshot['owner'],
        cate = snapshot['cate'],
        PRate = snapshot['rate'],
        ownerRate = snapshot['ownerRate'],
        ownerName = snapshot['ownerName'];


}
