class Launch {
  Links? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  int? window;
  String? rocket;
  bool? success;
  String? details;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  bool? autoUpdate;
  bool? tbd;
  String? id;

  Launch({
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.window,
    this.rocket,
    this.success,
    this.details,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.autoUpdate,
    this.tbd,
    this.id,
  });

  Launch.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];

    details = json['details'];
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    id = json['id'];
  }
}

class Links {
  Patch? patch;
  Flickr? flickr;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links(
      {this.patch,
      this.flickr,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;
    flickr = json['flickr'] != null ? Flickr.fromJson(json['flickr']) : null;
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }
}

class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }
}

class Flickr {
  List<String>? small;
  List<String>? original;

  Flickr({this.small, this.original});

  Flickr.fromJson(Map<String, dynamic> json) {
    if (json['small'] != null) {
      small = [];
      json['small'].forEach((v) {
        small!.add(v);
      });
    }
    if (json['original'] != null) {
      original = [];
      json['original'].forEach((v) {
        original!.add(v);
      });
    }
  }
}
