class CountryModel {
  final String countryNameKor;
  final String countryNameEng;
  final String countryCode;
  final String capital;
  final int population;
  final String populationExp;
  final int area;
  final String areaExp;
  final String language;
  final String religion;
  final String people;
  final String climate;
  final String founding;

  CountryModel(
      {required this.countryNameKor,
      required this.countryNameEng,
      required this.countryCode,
      required this.capital,
      required this.population,
      required this.populationExp,
      required this.area,
      required this.areaExp,
      required this.language,
      required this.religion,
      required this.people,
      required this.climate,
      required this.founding});

  CountryModel.fromJson(Map<String, dynamic> json)
      : countryNameKor = json["countryNameKor"],
        countryNameEng = json["countryNameEng"],
        countryCode = json["countryCode"],
        capital = json["capital"],
        population = json["population"],
        populationExp = json["populationExp"],
        area = json["area"],
        areaExp = json["areaExp"],
        language = json["language"],
        religion = json["religion"],
        people = json["people"],
        climate = json["climate"],
        founding = json["founding"];
}
