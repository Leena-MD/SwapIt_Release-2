class goodsModel {
  String? uid;
  String? name;
  String? desc;
  String? img;
  String? stat;
  int? gnum;
  String? own;
  String? cate;
  String?IDgoods;

  goodsModel(
      {this.uid,
      this.name,
      this.desc,
      this.img,
      this.gnum,
      this.stat,
      this.own,
      this.cate,
      this.IDgoods});

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
        cate: map['cate']);
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
      'cate': cate
    };
  }
}
