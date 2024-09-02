class LocationUsers {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinates timezone;

  LocationUsers({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory LocationUsers.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCoordinates.fromMap(json['coordinates']);

    final street = LocationStreet.fromMap(json['street']);

    final timezone = LocationTimezoneCoordinates.fromMap(json['timezone']);
    return LocationUsers(
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      postcode: json['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
  }
}

class LocationStreet {
  final String number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'].toString(),
      name: json['name'] ?? '',
    );
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;

  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinates.fromMap(Map<String, dynamic> json) {
    return LocationCoordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class LocationTimezoneCoordinates {
  final String offset;
  final String description;

  LocationTimezoneCoordinates({
    required this.offset,
    required this.description,
  });

  factory LocationTimezoneCoordinates.fromMap(Map<String, dynamic> json) {
    return LocationTimezoneCoordinates(
      offset: json['offset'],
      description: json['description'],
    );
  }
}
