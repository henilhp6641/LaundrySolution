import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerOrderModel {
  String? address;
  int? availableTable;
  String? bookingSeat;
  Timestamp? date;
  String? id;
  String? image;
  String? name;
  double? price;
  double? totalPrice;
  String? userEmail;
  String? userId;
  String? userName;
  String? userPhonenumber;
  String? startTime;
  String? endTime;

  CustomerOrderModel(
      {this.address,
      this.availableTable,
      this.bookingSeat,
      this.date,
      this.id,
      this.image,
      this.name,
      this.price,
      this.totalPrice,
      this.userEmail,
      this.userId,
      this.userName,
      this.endTime,
      this.startTime,
      this.userPhonenumber});

  CustomerOrderModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    availableTable = json['available_table'];
    bookingSeat = json['booking_seat'];
    date = json['date'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    totalPrice = json['total_price'];
    userEmail = json['user_email'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhonenumber = json['user_phonenumber'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['available_table'] = this.availableTable;
    data['booking_seat'] = this.bookingSeat;
    data['date'] = this.date;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    data['user_email'] = this.userEmail;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_phonenumber'] = this.userPhonenumber;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
