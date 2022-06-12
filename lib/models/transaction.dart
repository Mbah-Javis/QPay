class UserTransaction {
  int? id;
  String? title;
  int? phoneNumber;
  int? amount;
  String? date;
  String? time;
  String? transactionType;

  UserTransaction({this.id,
    this.title,
    this.phoneNumber,
    this.amount,
    this.date,
    this.time,
    this.transactionType,
  });

  UserTransaction.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    phoneNumber = json['phoneNumber'];
    amount = json['amount'];
    date = json['date'];
    time = json['time'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['phoneNumber'] = phoneNumber;
    data['amount'] = amount;
    data['date'] = date;
    data['time'] = time;
    data['transactionType'] = transactionType;
    return data;
  }
}