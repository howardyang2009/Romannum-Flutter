import 'package:romannum_flutter/businesses/roman_number_1_test.dart';
import 'package:romannum_flutter/businesses/roman_number_2.dart';

import '../business_interfaces/caculator.dart';

class RomanNumCalculator2Test extends RomanNumCalculator1Test {
  @override
  ICalculator getCalc() {
    return RomanNumber2();
  }
}

void main() {
  RomanNumCalculator2Test().run();
}
