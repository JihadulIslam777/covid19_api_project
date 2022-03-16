class WorldStatesModel {
  WorldStatesModel({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.criticalPerOneMillion,
    this.recoveredPerOneMillion,
    this.affectedCountries,
  });

  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  factory WorldStatesModel.fromJson(Map<String, dynamic> json) {
    return WorldStatesModel(
      updated: json['updated'] as int,
      cases: json['cases'] as int,
      todayCases: json['todayCases'] as int,
      deaths: json['deaths'] as int,
      todayDeaths: json['todayDeaths'] as int,
      recovered: json['recovered'] as int,
      todayRecovered: json['todayRecovered'] as int,
      active: json['active'] as int,
      critical: json['critical'] as int,
      casesPerOneMillion: json['casesPerOneMillion'] as int,
      deathsPerOneMillion: json['deathsPerOneMillion'] as double,
      tests: json['casesPerOneMillion'] as int,
      testsPerOneMillion: json['testsPerOneMillion'] as double,
      population: json['population'] as int,
      oneCasePerPeople: json['oneCasePerPeople'] as int,
      oneDeathPerPeople: json['oneDeathPerPeople'] as int,
      oneTestPerPeople: json['oneTestPerPeople'] as int,
      activePerOneMillion: json['activePerOneMillion'] as double,
      recoveredPerOneMillion: json['recoveredPerOneMillion'] as double,
      criticalPerOneMillion: json['criticalPerOneMillion'] as double,
      affectedCountries: json['affectedCountries'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critival': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries,
      };
}
