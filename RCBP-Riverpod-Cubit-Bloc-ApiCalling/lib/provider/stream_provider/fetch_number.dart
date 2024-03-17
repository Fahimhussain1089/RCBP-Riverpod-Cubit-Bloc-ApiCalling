Stream<int> fetchNumber(){
  return Stream<int>.periodic(Duration(seconds: 1),
      (number)=>number,
  ).take(20000);
}