import 'package:cloud_firestore/cloud_firestore.dart';

class DishesModel {
  Timestamp? date;
  String? image;
  String? address;
  num? price;
  String? name;
  int? availableTable;
  String? id;
  String? menuType;
  String? endTime;
  String? startTime;

  DishesModel(
      {this.date,
      this.image,
      this.address,
      this.price,
      this.name,
      this.id,
      this.startTime,
      this.endTime,
      this.menuType,
      this.availableTable});

  DishesModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    image = json['image'];
    address = json['address'];
    price = json['price'];
    name = json['name'];
    availableTable = json['available_table'];
    id = json['id'];
    menuType = json['menu_type'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['image'] = this.image;
    data['address'] = this.address;
    data['price'] = this.price;
    data['name'] = this.name;
    data['available_table'] = this.availableTable;
    data['id'] = this.id;
    data['menu_type'] = this.menuType;
    data['endTime'] = this.endTime;
    return data;
  }
}
