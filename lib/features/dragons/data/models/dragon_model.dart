class Dragon {
  String? firstFlight;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? dryMassKg;
  int? dryMassLb;
  String? wikipedia;
  String? description;
  String? id;

  Dragon({
    this.firstFlight,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.dryMassKg,
    this.dryMassLb,
    this.wikipedia,
    this.description,
    this.id,
  });

  Dragon.fromJson(Map<String, dynamic> json) {
    firstFlight = json['first_flight'];
    flickrImages = json['flickr_images'].cast<String>();
    name = json['name'];
    type = json['type'];
    active = json['active'];
    crewCapacity = json['crew_capacity'];

    dryMassKg = json['dry_mass_kg'];
    dryMassLb = json['dry_mass_lb'];

    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
}
