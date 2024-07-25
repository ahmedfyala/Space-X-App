class AboutCompany {
  Links? links;
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  int? valuation;
  String? summary;
  String? id;

  AboutCompany({
    this.links,
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.valuation,
    this.summary,
    this.id,
  });

  AboutCompany.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    name = json['name'];
    founder = json['founder'];
    founded = json['founded'];
    employees = json['employees'];
    vehicles = json['vehicles'];
    launchSites = json['launch_sites'];
    testSites = json['test_sites'];
    ceo = json['ceo'];
    cto = json['cto'];
    coo = json['coo'];
    valuation = json['valuation'];
    summary = json['summary'];
    id = json['id'];
  }
}

class Links {
  String? website;
  String? flickr;
  String? twitter;

  Links({
    this.website,
    this.flickr,
    this.twitter,
  });

  Links.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    flickr = json['flickr'];
    twitter = json['twitter'];
  }
}
