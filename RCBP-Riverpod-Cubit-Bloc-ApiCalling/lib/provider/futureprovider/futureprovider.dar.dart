Future<String> fetchWeatherReport() async{
  return await Future.delayed(Duration(seconds: 10),
      () => "30c",
  );
}