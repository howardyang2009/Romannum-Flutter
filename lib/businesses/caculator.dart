enum Calculator { RomanNumber1, RomanNumber2, RomanNumber3, RomanNumberEx }

abstract class ICalculator {
  int str2num(String input);
  String num2str(int num);
}
