import 'package:romannum_flutter/businesses/roman_number_1_test.dart';
import 'package:romannum_flutter/businesses/roman_number_3.dart';

import '../business_interfaces/caculator.dart';

class RomanNumCalculator3Test extends RomanNumCalculator1Test {
  @override
  ICalculator getCalc() {
    return RomanNumber3();
  }
}

void main() {
  RomanNumCalculator3Test().run();
}
