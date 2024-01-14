class Country {
  String name;
  String official_name;
  String alpha3Code;
  String capital;
  String region;
  String continent;
  int population;
  String flag;

  Country(
      {required this.alpha3Code,
      required this.capital,
      required this.continent,
      required this.name,
      required this.official_name,
      required this.region,
      required this.population,
      required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name'],
        alpha3Code: json['alpha3Code'],
        capital: json['capital'],
        continent: json['subregion'],
        official_name: json['official_name'],
        region: json['region'],
        flag: json['flag']['large'],
        population: json['population']);
  }

  static List<Country> fromJsonList(Map<dynamic, dynamic> jsonData) {
    List<Country> countries = [];
    jsonData.forEach((key, value) {
      countries.add(Country.fromJson(value));
    });
    return countries;
  }

  
}
