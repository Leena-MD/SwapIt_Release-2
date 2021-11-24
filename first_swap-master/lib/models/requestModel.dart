class requestModel {
  String? receivergoods;
  String? receiverID;
  String? requeststatus;
  String? senderID;
  String? sendergoods;


  requestModel(
      {this.receivergoods,
        this.receiverID,
        this.requeststatus,
        this.senderID,
        this.sendergoods,
});

  // receiving data from server
  factory requestModel.fromMap(map) {
    return requestModel(
      receivergoods: map['receiver goods'],
      receiverID: map['receiverID'],
      requeststatus: map['request status'],
      senderID: map['sender ID'],
      sendergoods: map['sender goods'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'receiver goods': receivergoods,
      'receiverID': receiverID,
      'request status': requeststatus,
      'sender ID': senderID,
      'sender goods': sendergoods,

    };
  }
}
