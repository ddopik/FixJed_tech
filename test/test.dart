 solution(List A, List <String> B, String P) {
  var nameList = ["carem", "tem", "tom", "jon", "bi"];
  var numberList = [2111, 1123123, 9717263, 2221122, 11];
  var query = 12313;

  for (int i = 0; i < numberList.length; i++) {
    for (int x=0; x < query.toString().length ;x++) {
      if (query.toString()[x] == numberList[i].toString()[0]) {
        return nameList[i];
      }
    }
  }
  print("other message");
  return "No Contact";
}