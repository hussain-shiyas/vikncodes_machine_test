// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileResModel profileModelFromJson(String str) => ProfileResModel.fromJson(json.decode(str));

String profileModelToJson(ProfileResModel data) => json.encode(data.toJson());

class ProfileResModel {
  final int? statusCode;
  final UserData? data;
  final CustomerData? customerData;

  ProfileResModel({
    this.statusCode,
    this.data,
    this.customerData,
  });

  factory ProfileResModel.fromJson(Map<String, dynamic> json) => ProfileResModel(
    statusCode: json["StatusCode"],
    data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    customerData: json["customer_data"] == null ? null : CustomerData.fromJson(json["customer_data"]),
  );

  Map<String, dynamic> toJson() => {
    "StatusCode": statusCode,
    "data": data?.toJson(),
    "customer_data": customerData?.toJson(),
  };
}

class CustomerData {
  final DateTime? dateOfBirth;
  final String? country;
  final int? phone;
  final String? state;
  final String? city;
  final String? address;
  final String? photo;
  final String? countryName;
  final String? stateName;

  CustomerData({
    this.dateOfBirth,
    this.country,
    this.phone,
    this.state,
    this.city,
    this.address,
    this.photo,
    this.countryName,
    this.stateName,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
    dateOfBirth: json["DateOfBirth"] == null ? null : DateTime.parse(json["DateOfBirth"]),
    country: json["Country"],
    phone: json["Phone"],
    state: json["State"],
    city: json["City"],
    address: json["Address"],
    photo: json["photo"],
    countryName: json["CountryName"],
    stateName: json["StateName"],
  );

  Map<String, dynamic> toJson() => {
    "DateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "Country": country,
    "Phone": phone,
    "State": state,
    "City": city,
    "Address": address,
    "photo": photo,
    "CountryName": countryName,
    "StateName": stateName,
  };
}

class UserData {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;

  UserData({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "email": email,
  };
}
