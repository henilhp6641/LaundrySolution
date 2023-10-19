class UserData {
  String? image;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String dateOfBirth;
  int age;
  String gender;
  String uid;
  String? registerDate;

  UserData({
     this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.uid,
    this.registerDate,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      image: json['image'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      dateOfBirth: json['dateOfBirth'],
      age: json['age'],
      gender: json['gender'],
      uid: json['uid'],
      registerDate: json['registerDate'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth,
      'age': age,
      'gender': gender,
      'registerDate': registerDate,
    };
  }
}
class Address {
  String? address1;
  String? address2;
  String? city;
  String? postalCode;
  String? country;
  String? phone;
  bool? isDefault;

  Address({
   this.address1,
   this.address2,
   this.city,
   this.postalCode,
   this.country,
   this.phone,
   this.isDefault,
  });


  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
      phone: json['phone'],
      isDefault: json['isDefault'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'address1': address1,
      'address2': address2,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'phone': phone,
      'isDefault': isDefault,
    };
  }
}