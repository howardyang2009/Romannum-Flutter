import 'package:romannum_flutter/business_interfaces/caculator.dart';
import 'package:romannum_flutter/businesses/roman_number_1.dart';

class RomanNumberEx extends RomanNumber1 implements ICalculator {
  RomanNumberEx() : super() {
    arrayNum = [
      1,
      5,
      10,
      50,
      100,
      500,
      1000,
      5000,
      10000,
      50000,
      100000,
      500000,
      1000000
    ];
    arrayLetter = [
      'I',
      'V',
      'X',
      'L',
      'C',
      'D',
      'M',
      'v',
      'x',
      'l',
      'c',
      'd',
      'm'
    ];
    init();
  }
}
