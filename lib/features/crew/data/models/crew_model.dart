class CrewMember {
  String? name;
  String? agency;
  String? image;
  String? wikipedia;
  String? status;
  String? id;

  CrewMember({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.status,
    this.id,
  });

  CrewMember.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    agency = json['agency'];
    image = json['image'];
    wikipedia = json['wikipedia'];
    status = json['status'];
    id = json['id'];
  }
}
