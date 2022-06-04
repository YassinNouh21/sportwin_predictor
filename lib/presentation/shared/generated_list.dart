
import 'dart:math';

List<int> randomList(){
  Random random = Random();
  var setRandomOne = <int>{};
  var setRandomtwo = <int>{};
  int i=0;
  while(true){
    setRandomOne.add(random.nextInt(8));
    i++;
    if(i == 200 || setRandomOne.length == 8){
      break;
    }
  }  
  int j=0;
  while(true){
    setRandomtwo.add(random.nextInt(8));
    j++;
    if(j == 200 || setRandomtwo.length == 8){
      break;
    }
  }
  List<int> list = [];
  list.addAll(setRandomtwo);
  list.addAll(setRandomOne);
  return list;
}