import 'dart:core';

class ShipModel {
  String? id;
  String? legacyId;
  String? homePort;
  String? link;
  String? imageUrl;
  String? shipName;
  bool? active;
  String? type;
  int? imo;
  int? mmSi;
  int? abs;
  int? clas;
  int? massKg;
  int? massLbs;
  int? yearBuilt;

  ShipModel(
      this.id,
      this.legacyId,
      this.homePort,
      this.link,
      this.imageUrl,
      this.shipName,
      this.active,
      this.type,
      this.imo,
      this.mmSi,
      this.abs,
      this.clas,
      this.massKg,
      this.massLbs,
      this.yearBuilt);

  ShipModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legacyId = json['legacy_Id'];
    homePort = json['home_port'];
    imageUrl = json['image'];
    link = json['link'];
    type = json['type'];
    imo = json['imo'];
    mmSi = json['mmsi'];
    abs = json['abs'];
    clas = json['class'];
    massKg = json['mass_kg'];
    massLbs = json['mass_lbs'];
    yearBuilt = json['year_built'];
    shipName = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'legacy_Id': legacyId,
      'home_port': homePort,
      'image': imageUrl,
      'link': link,
      'type': type,
      'imo': imo,
      'mmsi': mmSi,
      'abs': abs,
      'class': clas,
      'mass_kg': massKg,
      'mass_lbs': massLbs,
      'year_built': yearBuilt,
      'name': shipName,
      'active': active,
    };
  }
}
