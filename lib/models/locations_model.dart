import 'package:flutter/material.dart';

class Location {
  String name;
  String price;

  Location({required this.name, required this.price});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class LocationsModel extends ChangeNotifier {
  List<Location> _locations = [];

  List<Location> get locations => _locations;

  void addLocation(Location location) {
    _locations.add(location);
    notifyListeners();
  }

  void initialize() {
    Location peru = Location(name: 'Peru', price: '\$1,000');
    Location bolivia = Location(name: 'Bolivia', price: '\$500');
    Location chile = Location(name: 'Chile', price: '\$1,000');
    Location argentina = Location(name: 'Argentina', price: '\$1,000');
    Location brazil = Location(name: 'Brazil', price: '\$1,000');

    _locations.add(peru);
    _locations.add(bolivia);
    _locations.add(chile);
    _locations.add(argentina);
    _locations.add(brazil);
  }
}
