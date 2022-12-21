// To parse this JSON data, do
//
//     final prodect = prodectFromJson(jsonString);

import 'dart:convert';

Facility facilityFromJson(String str) => Facility.fromJson(json.decode(str));

String facilityToJson(Facility data) => json.encode(data.toJson());

class Facility {
  Facility({
    this.fid,
    this.numberOfFacility,
    required this.facilityName,
    required this.location,
    required this.numberOfParking,
    required this.image,
  });

  String? fid;
  final String facilityName;
  final String location;
  final int numberOfParking;
   int? numberOfFacility;
  String image;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        fid: json["fid"],
        facilityName: json["facilityName"],
        location: json["location"],
        numberOfParking: json["numberOfParking"],
        numberOfFacility: json["numberOfFacility"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "fid": fid,
        "facilityName": facilityName,
        "location": location,
        "numberOfParking": numberOfParking,
        "numberOfFacility": numberOfFacility,
        "image": image,
      };
}
