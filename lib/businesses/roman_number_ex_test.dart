import 'package:romannum_flutter/businesses/roman_number_1_test.dart';
import 'package:romannum_flutter/businesses/roman_number_ex.dart';

import '../business_interfaces/caculator.dart';

class RomanNumCalculatorExTest extends RomanNumCalculator1Test {
  @override
  ICalculator getCalc() {
    return RomanNumberEx();
  }

  @override
  Map<String, int> getStr2Num() {
    var result = super.getStr2Num();
    result.addAll({'mmmcmxcMxCMXCIX': 3999999});
    return result;
  }

  @override
  List<int> getErrorNums() {
    return [0, 4000000];
  }
}

void main() {
  RomanNumCalculatorExTest().run();
}
