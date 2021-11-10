class goodsModel {
  String? uid;
  String? name;
  String? desc;
  int? cat;
  String? img;
  String? stat;
  int? gnum;

  goodsModel({
    this.uid,
    this.name,
    this.desc,
    this.cat,
    this.img,
    this.gnum,
    this.stat,
  });

  // receiving data from server
  factory goodsModel.fromMap(map) {
    return goodsModel(
      uid: map['uid'],
      name: map['gName'],
      desc: map['Description'],
      cat: map['Category'],
      img: map['image'],
      gnum: map['numGood'],
      stat: map['Status'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'gName': name,
      'Description': desc,
      'Category': cat,
      'image': img,
      'numGood': gnum,
      'Status': stat,
    };
  }
}