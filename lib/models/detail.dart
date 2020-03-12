class CoronaDetail {
  final String country;
  final String totalCase;
  final String newCase;
  final String totalDeaths;
  final String newDeaths;
  final String totalRecovered;
  final String activeCases;
  final String critical;

  CoronaDetail({
    this.country,
    this.totalCase,
    this.newCase,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
    this.critical
  });

  CoronaDetail.fromJson(Map<String, dynamic> parsedJson)
    : country = parsedJson['country'],
      totalCase = parsedJson['total_case'],
      newCase = parsedJson['new_case'],
      totalDeaths = parsedJson['total_deaths'],
      newDeaths = parsedJson['new_deaths'],
      totalRecovered = parsedJson['total_recovered'],
      activeCases = parsedJson['active_cases'],
      critical = parsedJson['critical'];
}