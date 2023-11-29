import 'package:romannum_flutter/businesses/caculator.dart';

class RomanNumber2 implements ICalculator {
  var lookup = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };
  var numeralCodes = [
    ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"], // Ones
    ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"], // Tens
    ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"], // Hundreds
    ["", "M", "MM", "MMM"], // Thousands
  ];

  var num_min = 1;
  var num_max = 3999;

  @override
  String num2str(int num) {
    String numeral = '';
    if (num < num_min || num > num_max)
      throw 'number $num exceed scope [$num_min,$num_max]';

    var digits = num.toString().split('');

    for (int i = 0; i < digits.length; i++) {
      var one = digits.length - 1 - i;
      var two = int.parse(digits[i]);
      numeral += numeralCodes[one][two];
    }

    return numeral;
  }

  @override
  int str2num(String input) {
    var arabic = 0;
    var roman = input.trim();
    var i = roman.length - 1;
    while (i >= 0) {
      if (i != roman.length - 1 &&
          _char2num(roman[i]) < _char2num(roman[i + 1])) {
        arabic -= _char2num(roman[i]);
      } else {
        arabic += _char2num(roman[i]);
      }
      i--;
    }

    var temp = num2str(arabic);
    if (temp != roman) throw 'non-standard Roman Number';

    return arabic;
  }

  int _char2num(String char) {
    if (lookup.containsKey(char)) return lookup[char]!;

    var errorInfo = 'valid letter just could be ';
    errorInfo += lookup.keys.join();
    throw errorInfo;
  }
}
