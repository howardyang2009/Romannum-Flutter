import 'package:romannum_flutter/businesses/caculator.dart';

class RomanNumber1 implements ICalculator {
  var arrayNum = [1, 5, 10, 50, 100, 500, 1000];
  var arrayLetter = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];

  int num_min = 0;
  int num_max = 0;

  RomanNumber1() {
    init();
  }

  void init() {
    num_min = 1;
    num_max = arrayNum.last * 4 - 1;
  }

  @override
  String num2str(int num) {
    String str = '';
    int times;

    if (num < num_min || num > num_max)
      throw 'number $num exceed scope [$num_min,$num_max]';

    for (var i = arrayNum.length - 1; i >= 0; i--) {
      times = (num / arrayNum[i]).floor();
      if (times == 4)
        // for IV XL CD 4 40 400
        str += arrayLetter[i] + arrayLetter[i + 1];
      else {
        for (var j = 0; j < times; j++) str += arrayLetter[i];
      }

      num -= times * arrayNum[i];

      // for IX VL CM 9 90 900
      if (!isOdd(i) && i != 0) {
        if (num >= ((arrayNum[i] * 0.9).floor())) {
          str += arrayLetter[i - 2] + arrayLetter[i];
          num -= ((arrayNum[i] * 0.9).floor());
        }
      }
    }
    return str;
  }

  @override
  int str2num(String input) {
    var str = input.trim();
    if (str.length <= 0) throw 'empty is invalid';

    int num = 0;
    int i = 0;
    String nextChar;
    int nextCharIndex = -1;
    while (i < str.length) {
      var currentChar = str[i];
      var currentCharIndex = charIndex(currentChar);

      if (i < str.length - 1) {
        nextChar = str[i + 1];
        nextCharIndex = charIndex(nextChar);
      }

      if (currentCharIndex < nextCharIndex)
        num -= char2num(currentChar);
      else
        num += char2num(currentChar);

      i++;
      nextCharIndex = -1;
    }

    var temp = num2str(num);
    if (temp != str) throw 'non-standard Roman Number';

    return num;
  }

  int charIndex(String char) {
    var index = arrayLetter.indexOf(char);
    if (index >= 0) return index;

    var errorInfo = 'valid letter just could be ';
    errorInfo += arrayLetter.join();
    throw errorInfo;
  }

  int char2num(String char) {
    var index = charIndex(char);
    return arrayNum[index];
  }

  bool isOdd(int num) {
    return num % 2 != 0;
  }
}
