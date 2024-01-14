class ContinentModel{
  String countryName;
  String flag;

  ContinentModel({
    required this.countryName,
    required this.flag
  });

  factory ContinentModel.fromJson(Map<String, dynamic> json){
    return ContinentModel(countryName: json['name']['common'], 
    flag: json['flags']['png']);
  }

  static List<ContinentModel> fromJsonListContinent(List<dynamic> jsonData) {
    List<ContinentModel> continents = [];
    jsonData.forEach((value) {
      continents.add(ContinentModel.fromJson(value));
    });
    return continents;
  }
}