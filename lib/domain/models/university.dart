import 'dart:convert'; // Importing the dart:convert library for encoding and decoding JSON data.

// This function takes in a JSON string and returns a list of UniversityData objects.
List<UniversityData> universityDataFromMap(String str) =>
    List<UniversityData>.from(
      json.decode(str).map(
            (x) => UniversityData.fromMap(x),
          ),
    );
    
// This function takes in a list of UniversityData objects and returns a JSON string.
String universityDataToMap(List<UniversityData> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toMap(),
        ),
      ),
    );

// This is a class representing university data.
class UniversityData {
  // These are the properties of the UniversityData class.
  final String? stateProvince;
  final List<String> domains;
  final List<String> webPages;
  final String name;
  final String alphaTwoCode;
  final String country;
  
  UniversityData({
    required this.stateProvince,
    required this.domains,
    required this.webPages,
    required this.name,
    required this.alphaTwoCode,
    required this.country,
  });


  // This is a factory method that creates a UniversityData object from a Map.
  factory UniversityData.fromMap(Map<String, dynamic> json) => UniversityData(
        stateProvince: json["state-province"] ?? "",
        domains: List<String>.from(json["domains"].map((x) => x)),
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        alphaTwoCode: json["alpha_two_code"],
        country: json["country"],
      );

  // This is a method that converts a UniversityData object to a Map.
  Map<String, dynamic> toMap() => {
        "state-province": stateProvince == "" ? null : stateProvince,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
        "alpha_two_code": alphaTwoCode,
        "country": country,
      };
}
