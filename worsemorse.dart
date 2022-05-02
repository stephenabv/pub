// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:core';

var morseCode = [
  ".-",
  "-...",
  "-.-.",
  "-..",
  ".",
  "..-.",
  "--.",
  "....",
  "..",
  ".---",
  "-.-",
  ".-..",
  "--",
  "-.",
  "---",
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-",
  "..-",
  "...-",
  ".--",
  "-..-",
  "-.--",
  "--.."
];
var ltr = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

void main() {
  print("Input: ");
  var str = stdin.readLineSync();
  decode(str, " ");
}

decode(var encode, var decode) {
  if (encode.length == 0) {
    print(decode);
  } else {
    for (int i = 0; i < 26; i++) {
      if (encode.startsWith(morseCode[i])) {
        var currentDecoded = decode + ltr[i];
        var currentToDecode = encode.substring(morseCode[i].length);
        decode(currentToDecode, currentDecoded);
      }
    }
  }
}
