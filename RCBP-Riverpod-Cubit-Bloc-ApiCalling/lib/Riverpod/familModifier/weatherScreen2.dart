

Future<String> fetchWeatherReport2( String city) async{
  return await Future.delayed(Duration(seconds: 2),
        () => "City: $city | Tempracture: 49 Degree C",
  );
}