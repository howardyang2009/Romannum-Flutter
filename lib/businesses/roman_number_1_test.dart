import 'package:romannum_flutter/business_interfaces/caculator.dart';
import 'package:romannum_flutter/businesses/roman_number_1.dart';
import 'package:test/test.dart';

class RomanNumCalculator1Test {
  ICalculator getCalc() {
    return RomanNumber1();
  }

  Map<String, int> getStr2Num() {
    return {
      'I': 1,
      'II': 2,
      'III': 3,
      'IV': 4,
      'V': 5,
      'VI': 6,
      'VII': 7,
      'VIII': 8,
      'IX': 9,
      'LXXIV': 74,
      'XCIX': 99,
      'DII': 502,
      'DXV': 515,
      'DLXXVI': 576,
      'CM': 900,
      'MCLI': 1151,
      'MDCLXVI': 1666,
      'MMMIII': 3003,
      'MMMCMXCIX': 3999,
      //'mmmcmxcMxCMXCIX': 3999999,
    };
  }

  List<String> getErrorStrs() {
    return ['', 'IIV', 'VX', 'VB', 'IL', 'CMM', 'VV', 'VIIII', 'IVI'];
  }

  List<int> getErrorNums() {
    return [0, 4000];
  }

  void run() {
    var calc = getCalc();

    var str2num = getStr2Num();

    var errorStrs = getErrorStrs();

    var errorNums = getErrorNums();

    group('str2num correct', () {
      str2num.forEach((String input, int expected) {
        test('str2num', () {
          expect(calc.str2num(input), expected);
        });
      });
    });

    group('str2num throw', () {
      errorStrs.forEach((String input) {
        test('str2num throw', () {
          expect(() => calc.str2num(input), throwsA(isA<String>()));
        });
      });
    });

    group('num2str correct', () {
      str2num.forEach((String expected, int input) {
        test('num2str', () {
          expect(calc.num2str(input), expected);
        });
      });
    });

    group('num2str throw', () {
      errorNums.forEach((int input) {
        test('num2str throw', () {
          expect(() => calc.num2str(input), throwsA(isA<String>()));
        });
      });
    });
  }
}

void main() {
  RomanNumCalculator1Test().run();
}
