import 'package:romannum_flutter/business_interfaces/caculator.dart';
import 'package:romannum_flutter/businesses/roman_number_1.dart';

class RomanNumber3 extends RomanNumber1 implements ICalculator {
  @override
  int str2num(String input) {
    var str = input.trim();
    if (str.isEmpty) throw 'empty is invalid';

    int tempIndex;
    String tempStr;
    String errorInfo;
    String currentChar;
    int currentCharIndex;
    String nextChar;
    int nextCharIndex;

    var num = 0;
    var sameLetter = 0;
    var i = 0;
    while (i < str.length) {
      currentChar = str[i];
      currentCharIndex = charIndex(currentChar);

      if (i == str.length - 1) {
        num += char2num(currentChar) * (sameLetter + 1);
      } else {
        nextChar = str[i + 1];
        nextCharIndex = charIndex(nextChar);
        if (nextCharIndex < currentCharIndex) {
          num += char2num(currentChar) * (sameLetter + 1);
          sameLetter = 0;
        } else if (nextCharIndex > currentCharIndex) {
          //for IIV
          if (sameLetter >= 1) {
            throw 'the left subtractive number should not more than one time, for example: IIV is invalid';
          }

          //small left just could be I X C
          if (isOdd(currentCharIndex)) {
            errorInfo = 'the left subtractive number just could be ';
            for (var i = 0; i < arrayLetter.length; i += 2) {
              errorInfo += arrayLetter[i];
            }
            errorInfo += ', for example: VX is invalid';
            throw errorInfo;
          }

          //99 is not IC, is XCIX
          if (nextCharIndex > (currentCharIndex + 2)) {
            throw 'the subtractive number just could be IX or IV style, for example: 99 is not IC, is XCIX';
          }

          //for big roman number left
          if (i + 2 < str.length) {
            tempIndex = charIndex(str[i + 2]);
            if (tempIndex >= nextCharIndex) {
              throw 'big roman number should be left, for example: CMM is invalid';
            }
          }

          if (i + 3 < str.length) {
            tempIndex = charIndex(str[i + 3]);
            if (tempIndex >= nextCharIndex) {
              throw 'big roman number should be left, for example: CMM is invalid';
            }
          }

          num += char2num(nextChar) - char2num(currentChar);
          i++;
          sameLetter = 0;
        } else if (nextCharIndex == currentCharIndex) {
          // V L D can not have more than one
          if (isOdd(currentCharIndex)) {
            errorInfo = 'should not repeat ';
            for (var i = 1; i < arrayLetter.length; i += 2) {
              errorInfo += arrayLetter[i];
            }
            errorInfo += ' letter';
            throw errorInfo;
          }

          // for VIIII
          if (sameLetter >= 2) {
            errorInfo = 'should not repeat ';
            for (var i = 0; i < arrayLetter.length; i += 2) {
              errorInfo += arrayLetter[i];
            }
            errorInfo += ' more than 3 times';
            throw errorInfo;
          }

          sameLetter++;
        }
      }
      i++;
    }

    tempStr = num2str(num);
    if (tempStr != str) throw 'non-standard Roman Number';

    return num;
  }
}
